.class public final Lcom/android/launcher3/taskbar/navbutton/c$a;
.super Ljava/lang/Object;
.source "NavButtonLayoutFactory.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/navbutton/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/navbutton/c$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/h0;Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;Landroid/content/res/Resources;ZZZZI)Lcom/android/launcher3/taskbar/navbutton/c$b;
    .locals 9

    .line 1
    const-string p0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "navButtonsView"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "resources"

    .line 12
    .line 13
    invoke-static {p6, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const p0, 0x7f0b0250

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, p0}, Landroid/widget/FrameLayout;->requireViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "requireViewById(...)"

    .line 24
    .line 25
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object v2, p0

    .line 29
    check-cast v2, Landroid/widget/LinearLayout;

    .line 30
    .line 31
    const p0, 0x7f0b024f

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p0}, Landroid/widget/FrameLayout;->requireViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    move-object v3, p0

    .line 42
    check-cast v3, Landroid/view/ViewGroup;

    .line 43
    .line 44
    const p0, 0x7f0b058d

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, p0}, Landroid/widget/FrameLayout;->requireViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    move-object v4, p0

    .line 55
    check-cast v4, Landroid/view/ViewGroup;

    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    const/4 v0, 0x1

    .line 59
    if-eqz p10, :cond_0

    .line 60
    .line 61
    if-eqz p9, :cond_0

    .line 62
    .line 63
    move v5, v0

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move v5, p0

    .line 66
    :goto_0
    if-eqz p10, :cond_1

    .line 67
    .line 68
    if-nez p9, :cond_1

    .line 69
    .line 70
    move v6, v0

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    move v6, p0

    .line 73
    :goto_1
    if-eqz p8, :cond_2

    .line 74
    .line 75
    new-instance v0, Lcom/android/launcher3/taskbar/navbutton/m;

    .line 76
    .line 77
    move-object v6, p3

    .line 78
    move-object v7, p4

    .line 79
    move-object v8, p5

    .line 80
    move-object v1, p6

    .line 81
    move-object v5, v4

    .line 82
    move-object v4, v3

    .line 83
    move-object v3, v2

    .line 84
    move-object v2, p2

    .line 85
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/taskbar/navbutton/m;-><init>(Landroid/content/res/Resources;Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 86
    .line 87
    .line 88
    return-object v0

    .line 89
    :cond_2
    move-object v1, v4

    .line 90
    move-object v4, v3

    .line 91
    move-object v3, v2

    .line 92
    if-eqz v5, :cond_5

    .line 93
    .line 94
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 95
    .line 96
    if-nez p1, :cond_3

    .line 97
    .line 98
    invoke-virtual {p2, p0}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->setIsVertical(Z)V

    .line 99
    .line 100
    .line 101
    new-instance v0, Lcom/android/launcher3/taskbar/navbutton/k;

    .line 102
    .line 103
    move-object v5, p3

    .line 104
    move-object v6, p4

    .line 105
    move-object v7, p5

    .line 106
    move-object v2, v3

    .line 107
    move-object v3, v4

    .line 108
    move-object v4, v1

    .line 109
    move-object v1, p6

    .line 110
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/taskbar/navbutton/k;-><init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 111
    .line 112
    .line 113
    return-object v0

    .line 114
    :cond_3
    move/from16 p0, p11

    .line 115
    .line 116
    move-object v5, v1

    .line 117
    if-ne p0, v0, :cond_4

    .line 118
    .line 119
    invoke-virtual {p2, v0}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->setIsVertical(Z)V

    .line 120
    .line 121
    .line 122
    new-instance v0, Lcom/android/launcher3/taskbar/navbutton/j;

    .line 123
    .line 124
    move-object v6, p4

    .line 125
    move-object v7, p5

    .line 126
    move-object v1, p6

    .line 127
    move-object v2, v3

    .line 128
    move-object v3, v4

    .line 129
    move-object v4, v5

    .line 130
    move-object v5, p3

    .line 131
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/taskbar/navbutton/j;-><init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 132
    .line 133
    .line 134
    return-object v0

    .line 135
    :cond_4
    invoke-virtual {p2, v0}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->setIsVertical(Z)V

    .line 136
    .line 137
    .line 138
    new-instance v0, Lcom/android/launcher3/taskbar/navbutton/l;

    .line 139
    .line 140
    move-object v6, p4

    .line 141
    move-object v7, p5

    .line 142
    move-object v1, p6

    .line 143
    move-object v2, v3

    .line 144
    move-object v3, v4

    .line 145
    move-object v4, v5

    .line 146
    move-object v5, p3

    .line 147
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/taskbar/navbutton/l;-><init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 148
    .line 149
    .line 150
    return-object v0

    .line 151
    :cond_5
    move-object v2, v3

    .line 152
    move-object v3, v4

    .line 153
    move-object v4, v1

    .line 154
    if-eqz v6, :cond_6

    .line 155
    .line 156
    new-instance v0, Lcom/android/launcher3/taskbar/navbutton/i;

    .line 157
    .line 158
    move-object v5, p3

    .line 159
    move-object v6, p4

    .line 160
    move-object v7, p5

    .line 161
    move-object v1, p6

    .line 162
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/taskbar/navbutton/i;-><init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 163
    .line 164
    .line 165
    return-object v0

    .line 166
    :cond_6
    iget-boolean p0, p1, Lcom/android/launcher3/h0;->p3:Z

    .line 167
    .line 168
    if-eqz p0, :cond_8

    .line 169
    .line 170
    if-eqz p7, :cond_7

    .line 171
    .line 172
    new-instance v0, Lcom/android/launcher3/taskbar/navbutton/b;

    .line 173
    .line 174
    move-object v5, p3

    .line 175
    move-object v6, p4

    .line 176
    move-object v7, p5

    .line 177
    move-object v1, p6

    .line 178
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/taskbar/navbutton/b;-><init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 179
    .line 180
    .line 181
    return-object v0

    .line 182
    :cond_7
    new-instance v0, Lcom/android/launcher3/taskbar/navbutton/n;

    .line 183
    .line 184
    move-object v5, p3

    .line 185
    move-object v6, p4

    .line 186
    move-object v7, p5

    .line 187
    move-object v1, p6

    .line 188
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/taskbar/navbutton/n;-><init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 189
    .line 190
    .line 191
    return-object v0

    .line 192
    :cond_8
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 193
    .line 194
    const-string p1, "No layoutter found"

    .line 195
    .line 196
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    throw p0
.end method
