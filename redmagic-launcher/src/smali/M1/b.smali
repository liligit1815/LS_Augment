.class public final LM1/b;
.super Ljava/lang/Object;
.source "ShapesProvider.kt"


# static fields
.field public static final a:LM1/b;

.field private static final b:[LM1/a;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    new-instance v0, LM1/b;

    .line 2
    .line 3
    invoke-direct {v0}, LM1/b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM1/b;->a:LM1/b;

    .line 7
    .line 8
    invoke-static {}, Lcom/android/systemui/shared/Flags;->newCustomizationPickerUi()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x5

    .line 23
    new-array v0, v0, [LM1/a;

    .line 24
    .line 25
    new-instance v3, LM1/a;

    .line 26
    .line 27
    const/16 v9, 0x10

    .line 28
    .line 29
    const/4 v10, 0x0

    .line 30
    const-string v4, "circle"

    .line 31
    .line 32
    const-string v5, "circle"

    .line 33
    .line 34
    const-string v6, "M50 0A50 50,0,1,1,50 100A50 50,0,1,1,50 0"

    .line 35
    .line 36
    const-string v7, "M 39.616 4 C 46.224 6.87 53.727 6.87 60.335 4 L 63.884 2.459 C 85.178 -6.789 106.789 14.822 97.541 36.116 L 96 39.665 C 93.13 46.273 93.13 53.776 96 60.384 L 97.541 63.934 C 106.789 85.227 85.178 106.839 63.884 97.591 L 60.335 96.049 C 53.727 93.179 46.224 93.179 39.616 96.049 L 36.066 97.591 C 14.773 106.839 -6.839 85.227 2.409 63.934 L 3.951 60.384 C 6.821 53.776 6.821 46.273 3.951 39.665 L 2.409 36.116 C -6.839 14.822 14.773 -6.789 36.066 2.459 Z"

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    invoke-direct/range {v3 .. v10}, LM1/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FILkotlin/jvm/internal/j;)V

    .line 40
    .line 41
    .line 42
    aput-object v3, v0, v2

    .line 43
    .line 44
    new-instance v4, LM1/a;

    .line 45
    .line 46
    const/16 v10, 0x10

    .line 47
    .line 48
    const/4 v11, 0x0

    .line 49
    const-string v5, "square"

    .line 50
    .line 51
    const-string v6, "square"

    .line 52
    .line 53
    const-string v7, "M53.689 0.82 L53.689 .82 C67.434 .82 74.306 .82 79.758 2.978 87.649 6.103 93.897 12.351 97.022 20.242 99.18 25.694 99.18 32.566 99.18 46.311 V53.689 C99.18 67.434 99.18 74.306 97.022 79.758 93.897 87.649 87.649 93.897 79.758 97.022 74.306 99.18 67.434 99.18 53.689 99.18 H46.311 C32.566 99.18 25.694 99.18 20.242 97.022 12.351 93.897 6.103 87.649 2.978 79.758 .82 74.306 .82 67.434 .82 53.689 L.82 46.311 C.82 32.566 .82 25.694 2.978 20.242 6.103 12.351 12.351 6.103 20.242 2.978 25.694 .82 32.566 .82 46.311 .82Z"

    .line 54
    .line 55
    const-string v8, "M 50 0 L 83.4 0 A 16.6 16.6 0 0 1 100 16.6 L 100 83.4 A 16.6 16.6 0 0 1 83.4 100 L 16.6 100 A 16.6 16.6 0 0 1 0 83.4 L 0 16.6 A 16.6 16.6 0 0 1 16.6 0 Z"

    .line 56
    .line 57
    const/4 v9, 0x0

    .line 58
    invoke-direct/range {v4 .. v11}, LM1/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FILkotlin/jvm/internal/j;)V

    .line 59
    .line 60
    .line 61
    aput-object v4, v0, v1

    .line 62
    .line 63
    new-instance v5, LM1/a;

    .line 64
    .line 65
    const-string v9, "M 49.85 6.764 L 50.013 6.971 L 50.175 6.764 C 53.422 2.635 58.309 0.207 63.538 0.207 C 65.872 0.207 68.175 0.692 70.381 1.648 L 71.79 2.264 L 71.792 2.265 A 3.46 3.46 0 0 0 74.515 2.265 L 74.517 2.264 L 75.926 1.652 A 17.1 17.1 0 0 1 82.769 0.207 C 88.495 0.207 93.824 3.117 97.022 7.989 C 100.21 12.848 100.697 18.712 98.36 24.087 L 97.749 25.496 V 25.497 A 3.45 3.45 0 0 0 97.749 28.222 V 28.223 L 98.36 29.632 C 100.697 35.007 100.207 40.871 97.022 45.73 A 17.5 17.5 0 0 1 93.264 49.838 L 93.06 50 L 93.264 50.162 A 17.5 17.5 0 0 1 97.022 54.27 C 100.21 59.129 100.697 64.993 98.36 70.368 V 71.778 A 3.45 3.45 0 0 0 97.749 74.503 V 74.504 L 98.36 75.913 C 100.697 81.288 100.207 87.152 97.022 92.011 C 93.824 96.883 88.495 99.793 82.769 99.793 C 80.435 99.793 78.132 99.308 75.926 98.348 L 74.517 97.736 H 74.515 A 3.5 3.5 0 0 0 73.153 97.455 C 72.682 97.455 72.225 97.552 71.792 97.736 H 71.79 L 70.381 98.348 A 17.1 17.1 0 0 1 63.538 99.793 C 58.309 99.793 53.422 97.365 50.175 93.236 L 50.013 93.029 L 49.85 93.236 C 46.603 97.365 41.717 99.793 36.488 99.793 C 34.154 99.793 31.851 99.308 29.645 98.348 L 28.236 97.736 H 28.234 A 3.5 3.5 0 0 0 26.872 97.455 C 26.401 97.455 25.944 97.552 25.511 97.736 H 25.509 L 24.1 98.348 A 17.1 17.1 0 0 1 17.257 99.793 C 11.53 99.793 6.202 96.883 3.004 92.011 C -0.181 87.152 -0.671 81.288 1.661 75.913 L 2.277 74.504 V 74.503 A 3.45 3.45 0 0 0 2.277 71.778 V 71.777 L 1.665 70.368 C -0.671 64.993 -0.181 59.129 3.004 54.274 A 17.5 17.5 0 0 1 6.761 50.162 L 6.965 50 L 6.761 49.838 A 17.5 17.5 0 0 1 3.004 45.73 C -0.181 40.871 -0.671 35.007 1.665 29.632 L 2.277 28.223 V 28.222 A 3.45 3.45 0 0 0 2.277 25.497 V 25.496 L 1.665 24.087 C -0.671 18.712 -0.181 12.848 3.004 7.994 V 7.993 C 6.202 3.117 11.53 0.207 17.257 0.207 C 19.591 0.207 21.894 0.692 24.1 1.652 L 25.509 2.264 L 25.511 2.265 A 3.46 3.46 0 0 0 28.234 2.265 L 28.236 2.264 L 29.645 1.652 A 17.1 17.1 0 0 1 36.488 0.207 C 41.717 0.207 46.603 2.635 49.85 6.764 Z"

    .line 66
    .line 67
    const v10, 0x3f5d01d7

    .line 68
    .line 69
    .line 70
    const-string v6, "four_sided_cookie"

    .line 71
    .line 72
    const-string v7, "4 sided cookie"

    .line 73
    .line 74
    const-string v8, "M39.888,4.517C46.338 7.319 53.662 7.319 60.112 4.517L63.605 3C84.733 -6.176 106.176 15.268 97 36.395L95.483 39.888C92.681 46.338 92.681 53.662 95.483 60.112L97 63.605C106.176 84.732 84.733 106.176 63.605 97L60.112 95.483C53.662 92.681 46.338 92.681 39.888 95.483L36.395 97C15.267 106.176 -6.176 84.732 3 63.605L4.517 60.112C7.319 53.662 7.319 46.338 4.517 39.888L3 36.395C -6.176 15.268 15.267 -6.176 36.395 3Z"

    .line 75
    .line 76
    invoke-direct/range {v5 .. v10}, LM1/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;F)V

    .line 77
    .line 78
    .line 79
    const/4 v1, 0x2

    .line 80
    aput-object v5, v0, v1

    .line 81
    .line 82
    new-instance v6, LM1/a;

    .line 83
    .line 84
    const-string v10, "M 39.616 4 C 46.224 6.87 53.727 6.87 60.335 4 L 63.884 2.459 C 85.178 -6.789 106.789 14.822 97.541 36.116 L 96 39.665 C 93.13 46.273 93.13 53.776 96 60.384 L 97.541 63.934 C 106.789 85.227 85.178 106.839 63.884 97.591 L 60.335 96.049 C 53.727 93.179 46.224 93.179 39.616 96.049 L 36.066 97.591 C 14.773 106.839 -6.839 85.227 2.409 63.934 L 3.951 60.384 C 6.821 53.776 6.821 46.273 3.951 39.665 L 2.409 36.116 C -6.839 14.822 14.773 -6.789 36.066 2.459 Z"

    .line 85
    .line 86
    const v11, 0x3f666666    # 0.9f

    .line 87
    .line 88
    .line 89
    const-string v7, "seven_sided_cookie"

    .line 90
    .line 91
    const-string v8, "7 sided cookie"

    .line 92
    .line 93
    const-string v9, "M35.209 4.878C36.326 3.895 36.884 3.404 37.397 3.006 44.82 -2.742 55.18 -2.742 62.603 3.006 63.116 3.404 63.674 3.895 64.791 4.878 65.164 5.207 65.351 5.371 65.539 5.529 68.167 7.734 71.303 9.248 74.663 9.932 74.902 9.981 75.147 10.025 75.637 10.113 77.1 10.375 77.831 10.506 78.461 10.66 87.573 12.893 94.032 21.011 94.176 30.412 94.186 31.062 94.151 31.805 94.08 33.293 94.057 33.791 94.045 34.04 94.039 34.285 93.958 37.72 94.732 41.121 96.293 44.18 96.404 44.399 96.522 44.618 96.759 45.056 97.467 46.366 97.821 47.021 98.093 47.611 102.032 56.143 99.727 66.266 92.484 72.24 91.983 72.653 91.381 73.089 90.177 73.961 89.774 74.254 89.572 74.4 89.377 74.548 86.647 76.626 84.477 79.353 83.063 82.483 82.962 82.707 82.865 82.936 82.671 83.395 82.091 84.766 81.8 85.451 81.51 86.033 77.31 94.44 67.977 98.945 58.801 96.994 58.166 96.859 57.451 96.659 56.019 96.259 55.54 96.125 55.3 96.058 55.063 95.998 51.74 95.154 48.26 95.154 44.937 95.998 44.699 96.058 44.46 96.125 43.981 96.259 42.549 96.659 41.834 96.859 41.199 96.994 32.023 98.945 22.69 94.44 18.49 86.033 18.2 85.451 17.909 84.766 17.329 83.395 17.135 82.936 17.038 82.707 16.937 82.483 15.523 79.353 13.353 76.626 10.623 74.548 10.428 74.4 10.226 74.254 9.823 73.961 8.619 73.089 8.017 72.653 7.516 72.24 .273 66.266 -2.032 56.143 1.907 47.611 2.179 47.021 2.533 46.366 3.241 45.056 3.478 44.618 3.596 44.399 3.707 44.18 5.268 41.121 6.042 37.72 5.961 34.285 5.955 34.04 5.943 33.791 5.92 33.293 5.849 31.805 5.814 31.062 5.824 30.412 5.968 21.011 12.427 12.893 21.539 10.66 22.169 10.506 22.9 10.375 24.363 10.113 24.853 10.025 25.098 9.981 25.337 9.932 28.697 9.248 31.833 7.734 34.461 5.529 34.649 5.371 34.836 5.207 35.209 4.878Z"

    .line 94
    .line 95
    invoke-direct/range {v6 .. v11}, LM1/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;F)V

    .line 96
    .line 97
    .line 98
    const/4 v1, 0x3

    .line 99
    aput-object v6, v0, v1

    .line 100
    .line 101
    new-instance v7, LM1/a;

    .line 102
    .line 103
    const/16 v13, 0x10

    .line 104
    .line 105
    const/4 v14, 0x0

    .line 106
    const-string v8, "arch"

    .line 107
    .line 108
    const-string v9, "arch"

    .line 109
    .line 110
    const-string v10, "M50 0C77.614 0 100 22.386 100 50C100 85.471 100 86.476 99.9 87.321 99.116 93.916 93.916 99.116 87.321 99.9 86.476 100 85.471 100 83.46 100H16.54C14.529 100 13.524 100 12.679 99.9 6.084 99.116 .884 93.916 .1 87.321 0 86.476 0 85.471 0 83.46L0 50C0 22.386 22.386 0 50 0Z"

    .line 111
    .line 112
    const-string v11, "M 50 0 L 72.5 0 A 27.5 27.5 0 0 1 100 27.5 L 100 86.67 A 13.33 13.33 0 0 1 86.67 100 L 13.33 100 A 13.33 13.33 0 0 1 0 86.67 L 0 27.5 A 27.5 27.5 0 0 1 27.5 0 Z"

    .line 113
    .line 114
    const/4 v12, 0x0

    .line 115
    invoke-direct/range {v7 .. v14}, LM1/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FILkotlin/jvm/internal/j;)V

    .line 116
    .line 117
    .line 118
    const/4 v1, 0x4

    .line 119
    aput-object v7, v0, v1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_0
    new-array v0, v1, [LM1/a;

    .line 123
    .line 124
    new-instance v3, LM1/a;

    .line 125
    .line 126
    const/16 v9, 0x18

    .line 127
    .line 128
    const/4 v10, 0x0

    .line 129
    const-string v4, "circle"

    .line 130
    .line 131
    const-string v5, "circle"

    .line 132
    .line 133
    const-string v6, "M50 0A50 50,0,1,1,50 100A50 50,0,1,1,50 0"

    .line 134
    .line 135
    const/4 v7, 0x0

    .line 136
    const/4 v8, 0x0

    .line 137
    invoke-direct/range {v3 .. v10}, LM1/a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FILkotlin/jvm/internal/j;)V

    .line 138
    .line 139
    .line 140
    aput-object v3, v0, v2

    .line 141
    .line 142
    :goto_0
    sput-object v0, LM1/b;->b:[LM1/a;

    .line 143
    .line 144
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()[LM1/a;
    .locals 0

    .line 1
    sget-object p0, LM1/b;->b:[LM1/a;

    .line 2
    .line 3
    return-object p0
.end method
