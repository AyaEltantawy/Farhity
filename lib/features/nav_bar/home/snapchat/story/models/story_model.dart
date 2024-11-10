import 'story_user_model.dart';

enum MediaType { image, video }

class Story {
  final String url;
  final MediaType media;
  final Duration duration;
  final StoryUser user;

  const Story({
    required this.url,
    required this.media,
    required this.duration,
    required this.user,
  });
}
