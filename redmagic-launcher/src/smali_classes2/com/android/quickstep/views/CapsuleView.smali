.class public Lcom/android/quickstep/views/CapsuleView;
.super Landroid/widget/LinearLayout;
.source "CapsuleView.java"


# static fields
.field public static final CALL_VIEW_CODE:I = 0x0

.field private static final CAST_VIEW_CODE:I = 0x2

.field private static final DEBUG:Z = true

.field public static final INVALID_VIEW_CODE:I = -0x1

.field public static final MEETING_NEW_VER_VIEW_CODE:I = 0x4

.field public static final MEETING_VIEW_CODE:I = 0x3

.field public static final RECORD_VIEW_CODE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CapsuleView"


# instance fields
.field private mAppIconImage:Landroid/widget/ImageView;

.field private mDisplayText:Landroid/widget/TextView;

.field private final mIsRtl:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput-boolean p1, p0, Lcom/android/quickstep/views/CapsuleView;->mIsRtl:Z

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setLayoutDirection(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static getCapsuleView(Lcom/android/launcher3/C2;ILandroid/graphics/RectF;)Lcom/android/quickstep/views/CapsuleView;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const v4, 0x7f0e0082

    .line 28
    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    invoke-virtual {v3, v4, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/android/quickstep/views/CapsuleView;

    .line 36
    .line 37
    invoke-direct {v2, p0, p1, p2}, Lcom/android/quickstep/views/CapsuleView;->setupView(Lcom/android/launcher3/C2;ILandroid/graphics/RectF;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, v1, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p0, :cond_1

    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_1
    return-object v2
.end method

.method public static getContentTextOnCapsule(Lcom/android/launcher3/C2;I)V
    .locals 5

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v2, 0x4

    .line 13
    const/4 v3, 0x1

    .line 14
    if-nez p1, :cond_5

    .line 15
    .line 16
    sget-object p1, Lcom/android/launcher3/anim/C;->f0:Landroid/net/Uri;

    .line 17
    .line 18
    const-string v4, "count_status"

    .line 19
    .line 20
    invoke-static {p0, p1, v4}, Lcom/android/launcher3/anim/C;->F(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/anim/C;->B(Ljava/lang/String;)[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 v4, 0x0

    .line 33
    aget-object v4, p1, v4

    .line 34
    .line 35
    if-eqz v4, :cond_1

    .line 36
    .line 37
    iput-object v4, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    aget-object v4, p1, v3

    .line 41
    .line 42
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-eqz v4, :cond_2

    .line 47
    .line 48
    iput-object v1, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    aget-object p1, p1, v3

    .line 52
    .line 53
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eq p1, v2, :cond_4

    .line 58
    .line 59
    const/4 v2, 0x6

    .line 60
    if-eq p1, v2, :cond_3

    .line 61
    .line 62
    const/16 v2, 0xd

    .line 63
    .line 64
    if-eq p1, v2, :cond_3

    .line 65
    .line 66
    iput-object v1, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const p1, 0x7f1400e5

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iput-object p0, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const p1, 0x7f1400e6

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iput-object p0, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 95
    .line 96
    return-void

    .line 97
    :cond_5
    if-ne p1, v3, :cond_8

    .line 98
    .line 99
    sget-object p1, Lcom/android/launcher3/anim/C;->g0:Landroid/net/Uri;

    .line 100
    .line 101
    const-string v1, "record_count_status"

    .line 102
    .line 103
    invoke-static {p0, p1, v1}, Lcom/android/launcher3/anim/C;->F(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    if-nez p1, :cond_6

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_6
    invoke-static {p1}, Lcom/android/launcher3/anim/C;->E(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    if-eqz v1, :cond_7

    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eq p1, v2, :cond_7

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const p1, 0x7f140340

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    iput-object p0, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 138
    .line 139
    return-void

    .line 140
    :cond_7
    iput-object v1, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 141
    .line 142
    return-void

    .line 143
    :cond_8
    const/4 v1, 0x3

    .line 144
    if-eq p1, v1, :cond_9

    .line 145
    .line 146
    if-ne p1, v2, :cond_b

    .line 147
    .line 148
    :cond_9
    sget-object p1, Lcom/android/launcher3/anim/C;->h0:Landroid/net/Uri;

    .line 149
    .line 150
    const-string v1, "meeting_count_status"

    .line 151
    .line 152
    invoke-static {p0, p1, v1}, Lcom/android/launcher3/anim/C;->F(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    if-eqz p0, :cond_b

    .line 157
    .line 158
    const-string p1, "stop"

    .line 159
    .line 160
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-eqz p1, :cond_a

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_a
    invoke-static {p0}, Lcom/android/launcher3/anim/C;->E(Ljava/lang/String;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    iput-object p0, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 172
    .line 173
    :cond_b
    :goto_0
    return-void
.end method

.method private setupView(Lcom/android/launcher3/C2;ILandroid/graphics/RectF;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setupView viewType = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "CapsuleView"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 30
    .line 31
    invoke-static {p1, p2}, Lcom/android/quickstep/views/CapsuleView;->getContentTextOnCapsule(Lcom/android/launcher3/C2;I)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/quickstep/views/CapsuleView;->mDisplayText:Landroid/widget/TextView;

    .line 35
    .line 36
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    const v1, 0x7f080946

    .line 42
    .line 43
    .line 44
    const v2, 0x7f080947

    .line 45
    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    const/4 v4, 0x3

    .line 49
    if-eq v4, p2, :cond_4

    .line 50
    .line 51
    const/4 v5, 0x4

    .line 52
    if-ne v5, p2, :cond_0

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    if-nez p2, :cond_2

    .line 56
    .line 57
    iget-object p2, p0, Lcom/android/quickstep/views/CapsuleView;->mAppIconImage:Landroid/widget/ImageView;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {p1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const v4, 0x7f080942

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v4, v2}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    iget-boolean v1, v0, Lcom/android/launcher3/anim/C;->I:Z

    .line 82
    .line 83
    if-eqz v1, :cond_1

    .line 84
    .line 85
    const v1, 0x7f080945

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const v1, 0x7f080944

    .line 90
    .line 91
    .line 92
    :goto_0
    invoke-virtual {p1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {p2, v1, v2}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 101
    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_2
    if-ne v3, p2, :cond_7

    .line 105
    .line 106
    iget-object p2, p0, Lcom/android/quickstep/views/CapsuleView;->mAppIconImage:Landroid/widget/ImageView;

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-virtual {v5}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    const v6, 0x7f0817b0    # 1.80898E38f

    .line 121
    .line 122
    .line 123
    invoke-static {v4, v6, v5}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-virtual {p2, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    iget-boolean v4, v0, Lcom/android/launcher3/anim/C;->I:Z

    .line 135
    .line 136
    if-eqz v4, :cond_3

    .line 137
    .line 138
    move v1, v2

    .line 139
    :cond_3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-static {p2, v1, v2}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 152
    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_4
    :goto_1
    iget-object v5, p0, Lcom/android/quickstep/views/CapsuleView;->mAppIconImage:Landroid/widget/ImageView;

    .line 156
    .line 157
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    if-ne v4, p2, :cond_5

    .line 162
    .line 163
    const p2, 0x7f080eb5

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_5
    const p2, 0x7f08076b

    .line 168
    .line 169
    .line 170
    :goto_2
    invoke-virtual {p1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-static {v6, p2, v4}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    invoke-virtual {v5, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    iget-boolean v4, v0, Lcom/android/launcher3/anim/C;->I:Z

    .line 186
    .line 187
    if-eqz v4, :cond_6

    .line 188
    .line 189
    move v1, v2

    .line 190
    :cond_6
    invoke-virtual {p1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-static {p2, v1, v2}, LA/h;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 199
    .line 200
    .line 201
    :cond_7
    :goto_3
    iget-boolean p2, v0, Lcom/android/launcher3/anim/C;->I:Z

    .line 202
    .line 203
    if-eqz p2, :cond_8

    .line 204
    .line 205
    iget-object p2, p0, Lcom/android/quickstep/views/CapsuleView;->mDisplayText:Landroid/widget/TextView;

    .line 206
    .line 207
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    const v1, 0x7f070194

    .line 215
    .line 216
    .line 217
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 218
    .line 219
    .line 220
    move-result p2

    .line 221
    float-to-int p2, p2

    .line 222
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    float-to-int v1, v1

    .line 235
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    invoke-virtual {p0, p2, v2, v1, v4}, Landroid/widget/LinearLayout;->setPaddingRelative(IIII)V

    .line 240
    .line 241
    .line 242
    :cond_8
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    iget p2, p2, Lcom/android/launcher3/h0;->T0:I

    .line 247
    .line 248
    const/high16 v1, -0x80000000

    .line 249
    .line 250
    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 251
    .line 252
    .line 253
    move-result p2

    .line 254
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    const v2, 0x7f070193

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    float-to-int v1, v1

    .line 266
    const/high16 v4, 0x40000000    # 2.0f

    .line 267
    .line 268
    invoke-static {v1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    invoke-virtual {p0, p2, v1}, Landroid/widget/LinearLayout;->measure(II)V

    .line 273
    .line 274
    .line 275
    iget p2, v0, Lcom/android/launcher3/anim/C;->G:I

    .line 276
    .line 277
    if-eqz p2, :cond_c

    .line 278
    .line 279
    iget-boolean v1, v0, Lcom/android/launcher3/anim/C;->I:Z

    .line 280
    .line 281
    if-eqz v1, :cond_9

    .line 282
    .line 283
    if-ne p2, v3, :cond_9

    .line 284
    .line 285
    goto :goto_4

    .line 286
    :cond_9
    if-ne p2, v3, :cond_b

    .line 287
    .line 288
    sget-boolean p2, Lcom/android/launcher3/anim/C;->d0:Z

    .line 289
    .line 290
    if-eqz p2, :cond_a

    .line 291
    .line 292
    const p2, 0x7f070196

    .line 293
    .line 294
    .line 295
    goto :goto_5

    .line 296
    :cond_a
    const p2, 0x7f070195

    .line 297
    .line 298
    .line 299
    goto :goto_5

    .line 300
    :cond_b
    const p2, 0x7f070197

    .line 301
    .line 302
    .line 303
    goto :goto_5

    .line 304
    :cond_c
    :goto_4
    sget-boolean p2, Lcom/android/launcher3/anim/C;->d0:Z

    .line 305
    .line 306
    if-eqz p2, :cond_d

    .line 307
    .line 308
    const p2, 0x7f07019a

    .line 309
    .line 310
    .line 311
    goto :goto_5

    .line 312
    :cond_d
    const p2, 0x7f070199

    .line 313
    .line 314
    .line 315
    :goto_5
    iget-boolean v1, p0, Lcom/android/quickstep/views/CapsuleView;->mIsRtl:Z

    .line 316
    .line 317
    if-eqz v1, :cond_e

    .line 318
    .line 319
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    iget v1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 324
    .line 325
    int-to-float v1, v1

    .line 326
    sget v3, Lcom/android/launcher3/anim/C;->c0:I

    .line 327
    .line 328
    int-to-float v3, v3

    .line 329
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 330
    .line 331
    .line 332
    move-result-object v4

    .line 333
    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 334
    .line 335
    .line 336
    move-result-object v4

    .line 337
    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    .line 338
    .line 339
    mul-float/2addr v3, v4

    .line 340
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    invoke-virtual {v4, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 345
    .line 346
    .line 347
    move-result p2

    .line 348
    add-float/2addr v3, p2

    .line 349
    sub-float/2addr v1, v3

    .line 350
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 351
    .line 352
    .line 353
    move-result p2

    .line 354
    int-to-float p2, p2

    .line 355
    sub-float p2, v1, p2

    .line 356
    .line 357
    goto :goto_6

    .line 358
    :cond_e
    sget v1, Lcom/android/launcher3/anim/C;->c0:I

    .line 359
    .line 360
    int-to-float v1, v1

    .line 361
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 366
    .line 367
    .line 368
    move-result-object v3

    .line 369
    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 370
    .line 371
    mul-float/2addr v1, v3

    .line 372
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 373
    .line 374
    .line 375
    move-result-object v3

    .line 376
    invoke-virtual {v3, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 377
    .line 378
    .line 379
    move-result p2

    .line 380
    add-float/2addr p2, v1

    .line 381
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 382
    .line 383
    .line 384
    move-result v1

    .line 385
    int-to-float v1, v1

    .line 386
    add-float/2addr v1, p2

    .line 387
    :goto_6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    invoke-static {v3}, Lcom/android/internal/policy/SystemBarUtils;->getStatusBarHeight(Landroid/content/Context;)I

    .line 392
    .line 393
    .line 394
    move-result v3

    .line 395
    int-to-float v3, v3

    .line 396
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 397
    .line 398
    .line 399
    move-result-object v4

    .line 400
    const v5, 0x7f07018f

    .line 401
    .line 402
    .line 403
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 404
    .line 405
    .line 406
    move-result v4

    .line 407
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 408
    .line 409
    .line 410
    move-result-object v5

    .line 411
    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 412
    .line 413
    .line 414
    move-result v2

    .line 415
    sub-float v5, v3, v4

    .line 416
    .line 417
    sget-boolean v6, Lx1/O;->T:Z

    .line 418
    .line 419
    const/high16 v7, 0x40000000    # 2.0f

    .line 420
    .line 421
    if-eqz v6, :cond_f

    .line 422
    .line 423
    sub-float/2addr v3, v2

    .line 424
    div-float/2addr v3, v7

    .line 425
    goto :goto_7

    .line 426
    :cond_f
    sub-float/2addr v4, v2

    .line 427
    div-float/2addr v4, v7

    .line 428
    add-float v3, v5, v4

    .line 429
    .line 430
    :goto_7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 431
    .line 432
    .line 433
    move-result v2

    .line 434
    int-to-float v2, v2

    .line 435
    add-float/2addr v2, v3

    .line 436
    invoke-virtual {p3, p2, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 437
    .line 438
    .line 439
    float-to-int p2, p2

    .line 440
    float-to-int p3, v3

    .line 441
    float-to-int v1, v1

    .line 442
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 443
    .line 444
    .line 445
    move-result v2

    .line 446
    int-to-float v2, v2

    .line 447
    add-float/2addr v3, v2

    .line 448
    float-to-int v2, v3

    .line 449
    invoke-virtual {p0, p2, p3, v1, v2}, Landroid/widget/LinearLayout;->layout(IIII)V

    .line 450
    .line 451
    .line 452
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 453
    .line 454
    .line 455
    move-result p0

    .line 456
    int-to-float p0, p0

    .line 457
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/anim/C;->z0(Lcom/android/launcher3/C2;F)V

    .line 458
    .line 459
    .line 460
    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b00d9

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/views/CapsuleView;->mAppIconImage:Landroid/widget/ImageView;

    .line 14
    .line 15
    const v0, 0x7f0b021d

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/quickstep/views/CapsuleView;->mDisplayText:Landroid/widget/TextView;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const v1, 0x7f0706ea

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    int-to-float p0, p0

    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
