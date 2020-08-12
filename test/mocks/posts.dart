import 'package:mooncake/entities/entities.dart';

final Post testPost = Post(
  id: "1",
  parentId: "0",
  message: "Hello dreamers! ✨",
  created: "2020-01-21T13:16:10.123Z",
  lastEdited: "",
  allowsComments: true,
  subspace: "desmos",
  optionalData: {},
  owner: User.fromAddress("desmos1y35fex9005709966jxkcqcz2vdvmtfyaj4x93h"),
  reactions: [],
  commentsIds: [],
  status: PostStatus(value: PostStatusValue.TX_SUCCESSFULL),
);

final List<Post> testPosts = [
  Post(
    id: "1",
    parentId: "0",
    message: "Hello dreamers! ✨",
    created: "2020-01-21T13:16:10.123Z",
    lastEdited: "",
    allowsComments: true,
    subspace: "desmos",
    optionalData: {},
    owner: User.fromAddress("desmos1y35fex9005709966jxkcqcz2vdvmtfyaj4x93h"),
    reactions: [],
    commentsIds: [],
    status: PostStatus(value: PostStatusValue.TX_SUCCESSFULL),
  ),
  Post(
    id: "2",
    parentId: "0",
    message: "Welcome to a new world of social media 🗣️",
    created: "2020-01-21T13:20:10.123Z",
    lastEdited: "",
    allowsComments: true,
    subspace: "desmos",
    optionalData: {},
    owner: User.fromAddress("desmos16r460yaek3uqncjhnxez8v327qnxjw5k0crg9x"),
    reactions: [
      Reaction.fromValue(
        ":smile:",
        User.fromAddress("desmos1y35fex9005709966jxkcqcz2vdvmtfyaj4x93h"),
      ),
      Reaction.fromValue(
        ":100:",
        User.fromAddress("desmos16f9wz7yg44pjfhxyn22kycs0qjy778ng877usl"),
      )
    ],
    commentsIds: ["10"],
    status: PostStatus(value: PostStatusValue.TX_SUCCESSFULL),
  ),
  Post(
    id: "3",
    parentId: "0",
    message: "Are you ready to get a piece of the cake? 🥮️",
    created: "2020-01-21T13:21:10.123Z",
    lastEdited: "",
    allowsComments: true,
    subspace: "desmos",
    optionalData: {},
    owner: User.fromAddress("desmos15x3e6md5gdcsszc2nx88trnn85nn0qzgjwl9pj"),
    reactions: [],
    commentsIds: [],
    status: PostStatus(value: PostStatusValue.SENDING_TX),
  ),
  Post(
    id: "4",
    parentId: "0",
    message: "Join now the social network revolution 💪",
    created: "2020-01-21T14:21:10.123Z",
    lastEdited: "",
    allowsComments: true,
    subspace: "desmos",
    optionalData: {},
    owner: User.fromAddress("desmos15x3e6md5gdcsszc2nx88trnn85nn0qzgjwl9pj"),
    reactions: [
      Reaction.fromValue(
        ":angry:",
        User.fromAddress("desmos16f9wz7yg44pjfhxyn22kycs0qjy778ng877usl"),
      )
    ],
    commentsIds: [],
    status: PostStatus(value: PostStatusValue.STORED_LOCALLY),
  ),
  Post(
    id: "5",
    parentId: "0",
    message: "Available for both Android and iOS 🤖🍎",
    created: "2020-01-21T14:22:10.123Z",
    lastEdited: "",
    allowsComments: true,
    subspace: "desmos",
    optionalData: {},
    owner: User.fromAddress("desmos15x3e6md5gdcsszc2nx88trnn85nn0qzgjwl9pj"),
    reactions: [],
    commentsIds: [],
    status: PostStatus(value: PostStatusValue.STORED_LOCALLY),
  ),
];

final List<Post> testComments = [
  Post(
    id: "10",
    parentId: "2",
    message: "I can't believe I'm part of this! 🤩",
    created: "2020-01-21T13:18:10.123Z",
    lastEdited: "",
    allowsComments: true,
    subspace: "desmos",
    optionalData: {},
    owner: User.fromAddress("desmos1y35fex9005709966jxkcqcz2vdvmtfyaj4x93h"),
    reactions: [],
    commentsIds: [],
    status: PostStatus(value: PostStatusValue.TX_SUCCESSFULL),
  ),
  Post(
    id: "11",
    parentId: "2",
    message: "I can't believe I'm part of this! 🤩",
    created: "2020-01-21T13:18:10.123Z",
    lastEdited: "",
    allowsComments: true,
    subspace: "desmos",
    optionalData: {},
    owner: User.fromAddress("desmos1y35fex9005709966jxkcqcz2vdvmtfyaj4x93h"),
    reactions: [],
    commentsIds: [],
    status: PostStatus(value: PostStatusValue.TX_SUCCESSFULL),
  ),
];
