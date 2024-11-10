import 'package:untitled3/features/nav_bar/home/snapchat/story/models/story_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/story_model.dart';
import 'story_logic.dart';

// class StoryPage extends StatelessWidget {
//   const StoryPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final logic = Get.find<StoryLogic>();
//     final state = Get.find<StoryLogic>().state;
//
//     return Container();
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';

class StoryPage extends StatefulWidget {
  final List<Story> stories = Get.arguments;

  StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animController;
  VideoPlayerController? _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    _loadStory(story: widget.stories.first, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextStory();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<StoryLogic>();
    final state = Get.find<StoryLogic>().state;
    final Story story = widget.stories[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.stories.length,
              itemBuilder: (context, i) {
                final Story story = widget.stories[i];
                switch (story.media) {
                  case MediaType.image:
                    return CachedNetworkImage(
                      imageUrl: story.url,
                      fit: BoxFit.cover,
                    );
                  case MediaType.video:
                    return _videoController != null &&
                            _videoController!.value.isInitialized
                        ? FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: _videoController!.value.size.width,
                              height: _videoController!.value.size.height,
                              child: VideoPlayer(_videoController!),
                            ),
                          )
                        : const SizedBox.shrink();
                }
                return const SizedBox.shrink();
              },
            ),
            Positioned(
              top: 40.0,
              left: 10.0,
              right: 10.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: widget.stories
                        .asMap()
                        .map((i, e) {
                          return MapEntry(
                            i,
                            AnimatedBar(
                              animController: _animController,
                              position: i,
                              currentIndex: _currentIndex,
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1.5,
                      vertical: 10.0,
                    ),
                    child: UserInfo(user: story.user),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 540),
                    child: Container(
                        width: 360,
                        height: 53,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        // border:Border.all( width: 1,color:Colors.white),),,
                        child: TextButton
                            //  :BoxDecoration(borderRadius:BorderRadius.circular(12),color: Color child:s.transparent,
                            // border:Border.all( width: 1,color:Colors.white),),
                            (
                          onPressed: () {},
                          child: const Text("شارك الان فى المسابقة",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white)),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      previousStory();
    } else if (dx > 2 * screenWidth / 3) {
      nextStory();
    } else {
      _toggleVideoPlayback(story);
    }
  }

  void previousStory() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
        _loadStory(story: widget.stories[_currentIndex]);
      }
    });
  }

  void nextStory() {
    setState(() {
      if (_currentIndex < widget.stories.length - 1) {
        _currentIndex++;
        _loadStory(story: widget.stories[_currentIndex]);
      } else {
        _currentIndex = 0; // Loop back to the first story
        _loadStory(story: widget.stories[_currentIndex]);
      }
    });
  }

  void _toggleVideoPlayback(Story story) {
    if (story.media == MediaType.video) {
      if (_videoController?.value.isPlaying == true) {
        _videoController?.pause();
        _animController.stop();
      } else {
        _videoController?.play();
        _animController.forward();
      }
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    switch (story.media) {
      case MediaType.image:
        _animController.duration = story.duration;
        _animController.forward();
        break;
      case MediaType.video:
        _videoController?.dispose(); // Dispose previous controller
        _videoController = VideoPlayerController.network(story.url)
          ..initialize().then((_) {
            if (_videoController!.value.isInitialized) {
              setState(() {
                _animController.duration = _videoController!.value.duration;
                _videoController!.play();
                _animController.forward();
              });
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextStory() {
    if (_currentIndex + 1 < widget.stories.length) {
      setState(() {
        _currentIndex++;
        _loadStory(story: widget.stories[_currentIndex]);
      });
    } else {
      // Optionally pop or do something else after the last story
      Navigator.of(context).pop(); // Example on finishing the story
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    super.key,
    required this.animController,
    required this.position,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                if (position == currentIndex)
                  AnimatedBuilder(
                    animation: animController,
                    builder: (context, child) {
                      return _buildContainer(
                        constraints.maxWidth * animController.value,
                        Colors.white,
                      );
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final StoryUser user;

  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.close,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(width: 121.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Row(
                  children: [
                    Text("4 ايام مضت ",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffBAC0CA))),
                    Icon(Icons.timelapse, color: Color(0xffBAC0CA))
                  ],
                )
              ],
            ),
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage(
                user.profileImageUrl,
              ),
            ),

          ],
        ),
      ],
    );
  }
}
