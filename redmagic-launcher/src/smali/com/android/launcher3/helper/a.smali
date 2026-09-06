.class public Lcom/android/launcher3/helper/a;
.super Ljava/lang/Object;
.source "LauncherHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/helper/a$b;
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/C2;

.field private b:Landroid/app/Dialog;

.field private c:Landroidx/viewpager/widget/ViewPager;

.field private d:Landroid/widget/Button;

.field private e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private f:Lcom/android/launcher3/helper/a$b;

.field private g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

.field private h:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/lang/String;

.field private final j:Landroidx/viewpager/widget/ViewPager$j;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/helper/a$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/helper/a$a;-><init>(Lcom/android/launcher3/helper/a;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/helper/a;->j:Landroidx/viewpager/widget/ViewPager$j;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/helper/a;Lcom/zte/mifavor/widget/CheckBoxZTE;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/helper/a;->j(Lcom/zte/mifavor/widget/CheckBoxZTE;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/helper/a;ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/helper/a;->l(ILjava/lang/String;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/helper/a;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/helper/a;->k(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/helper/a;)Lcom/android/launcher3/helper/DotsPageIndicatorZTE;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method private f(I)Lcom/android/launcher3/helper/DotsPageIndicatorZTE$b;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/launcher3/helper/DotsPageIndicatorZTE$b;

    .line 2
    .line 3
    sget-object p1, Lcom/android/launcher3/helper/DotsPageIndicatorZTE$a;->j:Lcom/android/launcher3/helper/DotsPageIndicatorZTE$a;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/helper/DotsPageIndicatorZTE$b;-><init>(Lcom/android/launcher3/helper/DotsPageIndicatorZTE$a;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method private g()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/helper/a;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const v1, 0x7f0e0117

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const-string v1, "LauncherHelper"

    .line 21
    .line 22
    const-string v2, "initDialog: new helper dialog."

    .line 23
    .line 24
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    new-instance v1, Lx1/e;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    invoke-direct {v1, v2, v3}, Lx1/e;-><init>(Landroid/content/Context;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Lx1/e;->o(Landroid/view/View;)Lx1/e;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lx1/e;->a()Landroid/app/Dialog;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 52
    .line 53
    .line 54
    const v1, 0x7f0b033b

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Landroidx/viewpager/widget/ViewPager;

    .line 62
    .line 63
    iput-object v1, p0, Lcom/android/launcher3/helper/a;->c:Landroidx/viewpager/widget/ViewPager;

    .line 64
    .line 65
    const v1, 0x7f0b02d1

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Landroid/widget/Button;

    .line 73
    .line 74
    iput-object v1, p0, Lcom/android/launcher3/helper/a;->d:Landroid/widget/Button;

    .line 75
    .line 76
    const v1, 0x7f0b02d2

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/android/launcher3/helper/a;->g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 86
    .line 87
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_0

    .line 92
    .line 93
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->d:Landroid/widget/Button;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 100
    .line 101
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 102
    .line 103
    iget-object v2, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 104
    .line 105
    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    const v4, 0x7f070472

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    invoke-static {v2, v3}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 121
    .line 122
    iget-object v4, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 123
    .line 124
    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    const v6, 0x7f070471

    .line 129
    .line 130
    .line 131
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 132
    .line 133
    .line 134
    move-result v5

    .line 135
    invoke-static {v4, v5}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->d:Landroid/widget/Button;

    .line 143
    .line 144
    invoke-virtual {p0, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    .line 146
    .line 147
    :cond_0
    return-void
.end method

.method private h(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0e00fa

    .line 5
    .line 6
    .line 7
    const v1, 0x7f0b037a

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, -0x1

    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    sparse-switch v4, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :sswitch_0
    const-string v4, "help_enter_edit_state"

    .line 22
    .line 23
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-nez v4, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v3, 0x7

    .line 31
    goto :goto_0

    .line 32
    :sswitch_1
    const-string v4, "help_push_aside"

    .line 33
    .line 34
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-nez v4, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v3, 0x6

    .line 42
    goto :goto_0

    .line 43
    :sswitch_2
    const-string v4, "help_long_press_item"

    .line 44
    .line 45
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-nez v4, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v3, 0x5

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    const-string v4, "help_minors_mode"

    .line 55
    .line 56
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-nez v4, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const/4 v3, 0x4

    .line 64
    goto :goto_0

    .line 65
    :sswitch_4
    const-string v4, "help_icon_arrange"

    .line 66
    .line 67
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-nez v4, :cond_4

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 v3, 0x3

    .line 75
    goto :goto_0

    .line 76
    :sswitch_5
    const-string v4, "help_first_create_folder"

    .line 77
    .line 78
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-nez v4, :cond_5

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    const/4 v3, 0x2

    .line 86
    goto :goto_0

    .line 87
    :sswitch_6
    const-string v4, "help_long_press_folder_icon"

    .line 88
    .line 89
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-nez v4, :cond_6

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_6
    const/4 v3, 0x1

    .line 97
    goto :goto_0

    .line 98
    :sswitch_7
    const-string v4, "help_swipe_up"

    .line 99
    .line 100
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    if-nez v4, :cond_7

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_7
    const/4 v3, 0x0

    .line 108
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 109
    .line 110
    .line 111
    new-instance p0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v0, "initViewList: error type: "

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const-string p1, "LauncherHelper"

    .line 129
    .line 130
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :pswitch_0
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 137
    .line 138
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const v0, 0x7f0e00f7

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :pswitch_1
    invoke-static {}, Lx1/O;->b5()Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-eqz p1, :cond_b

    .line 158
    .line 159
    invoke-static {}, Lx1/O;->h5()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_b

    .line 164
    .line 165
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 166
    .line 167
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 168
    .line 169
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-virtual {p0, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :pswitch_2
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 182
    .line 183
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 184
    .line 185
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    const v3, 0x7f0e00fe

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 200
    .line 201
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    const v0, 0x7f0e00ff

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Lcom/airbnb/lottie/LottieAnimationView;

    .line 217
    .line 218
    sget-object v1, Lx1/g;->a:Ljava/lang/String;

    .line 219
    .line 220
    invoke-static {}, Lx1/g;->a()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    if-eqz v1, :cond_8

    .line 229
    .line 230
    const v1, 0x7f130016

    .line 231
    .line 232
    .line 233
    goto :goto_1

    .line 234
    :cond_8
    const v1, 0x7f130017

    .line 235
    .line 236
    .line 237
    :goto_1
    invoke-virtual {v0, v1}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 238
    .line 239
    .line 240
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 241
    .line 242
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :pswitch_3
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 247
    .line 248
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    const v0, 0x7f0e0100

    .line 253
    .line 254
    .line 255
    invoke-virtual {p1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 260
    .line 261
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    const v0, 0x7f0b03ca

    .line 265
    .line 266
    .line 267
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    check-cast p1, Lcom/zte/mifavor/widget/CheckBoxZTE;

    .line 272
    .line 273
    new-instance v0, Lo1/c;

    .line 274
    .line 275
    invoke-direct {v0, p0, p1}, Lo1/c;-><init>(Lcom/android/launcher3/helper/a;Lcom/zte/mifavor/widget/CheckBoxZTE;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :pswitch_4
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 283
    .line 284
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 285
    .line 286
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    const v0, 0x7f0e00fb

    .line 291
    .line 292
    .line 293
    invoke-virtual {p0, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :pswitch_5
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 302
    .line 303
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 304
    .line 305
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    const v3, 0x7f0e00f8

    .line 310
    .line 311
    .line 312
    invoke-virtual {v0, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 317
    .line 318
    .line 319
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 320
    .line 321
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    const v0, 0x7f0e00f9

    .line 326
    .line 327
    .line 328
    invoke-virtual {p1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    check-cast v0, Lcom/airbnb/lottie/LottieAnimationView;

    .line 337
    .line 338
    sget-object v1, Lx1/g;->a:Ljava/lang/String;

    .line 339
    .line 340
    invoke-static {}, Lx1/g;->a()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 345
    .line 346
    .line 347
    move-result v1

    .line 348
    if-eqz v1, :cond_9

    .line 349
    .line 350
    const v1, 0x7f13000b

    .line 351
    .line 352
    .line 353
    goto :goto_2

    .line 354
    :cond_9
    const v1, 0x7f13000c

    .line 355
    .line 356
    .line 357
    :goto_2
    invoke-virtual {v0, v1}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 358
    .line 359
    .line 360
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 361
    .line 362
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    :pswitch_6
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 367
    .line 368
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 369
    .line 370
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    const v3, 0x7f0e00fc

    .line 375
    .line 376
    .line 377
    invoke-virtual {v0, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 378
    .line 379
    .line 380
    move-result-object v0

    .line 381
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 385
    .line 386
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 387
    .line 388
    .line 389
    move-result-object p1

    .line 390
    const v0, 0x7f0e00fd

    .line 391
    .line 392
    .line 393
    invoke-virtual {p1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 394
    .line 395
    .line 396
    move-result-object p1

    .line 397
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    check-cast v0, Lcom/airbnb/lottie/LottieAnimationView;

    .line 402
    .line 403
    sget-object v1, Lx1/g;->a:Ljava/lang/String;

    .line 404
    .line 405
    invoke-static {}, Lx1/g;->a()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result v1

    .line 413
    if-eqz v1, :cond_a

    .line 414
    .line 415
    const v1, 0x7f13001c

    .line 416
    .line 417
    .line 418
    goto :goto_3

    .line 419
    :cond_a
    const v1, 0x7f13001d

    .line 420
    .line 421
    .line 422
    :goto_3
    invoke-virtual {v0, v1}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 423
    .line 424
    .line 425
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 426
    .line 427
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 428
    .line 429
    .line 430
    return-void

    .line 431
    :pswitch_7
    invoke-static {}, Lx1/O;->b5()Z

    .line 432
    .line 433
    .line 434
    move-result p1

    .line 435
    if-eqz p1, :cond_b

    .line 436
    .line 437
    invoke-static {}, Lx1/O;->h5()Z

    .line 438
    .line 439
    .line 440
    move-result p1

    .line 441
    if-eqz p1, :cond_b

    .line 442
    .line 443
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 444
    .line 445
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 446
    .line 447
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 448
    .line 449
    .line 450
    move-result-object p0

    .line 451
    invoke-virtual {p0, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 452
    .line 453
    .line 454
    move-result-object p0

    .line 455
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 456
    .line 457
    .line 458
    :cond_b
    return-void

    .line 459
    :sswitch_data_0
    .sparse-switch
        -0x60f9d302 -> :sswitch_7
        -0x510edc97 -> :sswitch_6
        -0x4e4df83c -> :sswitch_5
        -0x41e255dc -> :sswitch_4
        0x445ea1e6 -> :sswitch_3
        0x47dd2e34 -> :sswitch_2
        0x4e41bf91 -> :sswitch_1
        0x76c45b21 -> :sswitch_0
    .end sparse-switch

    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private i(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-interface {p0, p2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0, p2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    return v0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private synthetic j(Lcom/zte/mifavor/widget/CheckBoxZTE;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "initViewList HELP_TYPE_MINORS_MODE CheckBoxZTE isChecked = "

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const-string v0, "LauncherHelper"

    .line 23
    .line 24
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const-string p2, "help_minors_mode"

    .line 42
    .line 43
    invoke-static {p0, p2, p1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private synthetic k(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p1}, Lcom/android/launcher3/helper/a;->n(Landroid/content/Context;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic l(ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/android/launcher3/helper/a;->c:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    add-int/lit8 p1, p1, -0x1

    .line 8
    .line 9
    if-eq p3, p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->c:Landroidx/viewpager/widget/ViewPager;

    .line 12
    .line 13
    const/4 p3, 0x2

    .line 14
    invoke-virtual {p1, p3}, Landroidx/viewpager/widget/ViewPager;->d(I)Z

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lcom/android/launcher3/helper/a;->m(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->h:Ljava/util/function/Consumer;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-interface {p1, p3}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/helper/a;->e()V

    .line 31
    .line 32
    .line 33
    :goto_0
    const-string p1, "help_minors_mode"

    .line 34
    .line 35
    invoke-static {p2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 p2, 0x0

    .line 48
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/helper/a;->p(Landroid/content/Context;Z)V

    .line 49
    .line 50
    .line 51
    invoke-static {p2}, Lx1/O;->P4(Z)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public static n(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private o(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/helper/a;->h:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "LauncherHelper"

    .line 6
    .line 7
    const-string v1, "dismissHelpDialogIfNeed: dismiss help dialog."

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 15
    .line 16
    .line 17
    const-string v0, ""

    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/helper/a;->i:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public m(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "help_first_create_folder"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "help_long_press_folder_icon"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->c:Landroidx/viewpager/widget/ViewPager;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Landroid/view/View;

    .line 32
    .line 33
    const p1, 0x7f0b037a

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/airbnb/lottie/LottieAnimationView;

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-virtual {p0, p1}, Lcom/airbnb/lottie/LottieAnimationView;->setProgress(F)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public p(Landroid/content/Context;Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "help_minors_mode"

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->D1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const-string v0, "help_push_aside"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lx1/O;->E1()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto/16 :goto_1

    .line 30
    .line 31
    :cond_1
    invoke-static {}, Lx1/O;->p0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v1, "LauncherHelper"

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const-string p0, "showHelpIfNeed, running monkey!"

    .line 40
    .line 41
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    goto/16 :goto_1

    .line 54
    .line 55
    :cond_3
    const-string v0, "help_minors_mode"

    .line 56
    .line 57
    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    const/4 v3, 0x1

    .line 62
    if-eqz v2, :cond_4

    .line 63
    .line 64
    iget-object v2, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    const/4 v4, 0x0

    .line 75
    invoke-static {v2, v0, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-ne v2, v3, :cond_4

    .line 80
    .line 81
    goto/16 :goto_1

    .line 82
    .line 83
    :cond_4
    iget-object v2, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-direct {p0, v2, p1}, Lcom/android/launcher3/helper/a;->i(Landroid/content/Context;Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_5

    .line 94
    .line 95
    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-nez v2, :cond_5

    .line 100
    .line 101
    goto/16 :goto_1

    .line 102
    .line 103
    :cond_5
    iget-object v2, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 104
    .line 105
    if-eqz v2, :cond_6

    .line 106
    .line 107
    iget-object v2, p0, Lcom/android/launcher3/helper/a;->i:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_6

    .line 114
    .line 115
    new-instance p0, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    const-string v0, "showHelpIfNeed: same helper dialog."

    .line 121
    .line 122
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_6
    iput-object p1, p0, Lcom/android/launcher3/helper/a;->i:Ljava/lang/String;

    .line 137
    .line 138
    invoke-direct {p0}, Lcom/android/launcher3/helper/a;->g()V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, p1}, Lcom/android/launcher3/helper/a;->r(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_7

    .line 149
    .line 150
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p0, p1, v3}, Lcom/android/launcher3/helper/a;->p(Landroid/content/Context;Z)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 160
    .line 161
    if-eqz p1, :cond_8

    .line 162
    .line 163
    const v0, 0x7f140459

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setTitle(I)V

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_7
    new-instance v0, Lo1/a;

    .line 171
    .line 172
    invoke-direct {v0, p0, p1}, Lo1/a;-><init>(Lcom/android/launcher3/helper/a;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-direct {p0, v0}, Lcom/android/launcher3/helper/a;->o(Ljava/util/function/Consumer;)V

    .line 176
    .line 177
    .line 178
    :cond_8
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 179
    .line 180
    if-eqz p1, :cond_b

    .line 181
    .line 182
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 186
    .line 187
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    if-nez p1, :cond_9

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_9
    const/high16 v0, -0x80000000

    .line 195
    .line 196
    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 197
    .line 198
    .line 199
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 200
    .line 201
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    const-string v0, "window"

    .line 206
    .line 207
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    check-cast p1, Landroid/view/WindowManager;

    .line 212
    .line 213
    invoke-interface {p1}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    invoke-virtual {p1}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    iget-object v1, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 226
    .line 227
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    if-nez v2, :cond_a

    .line 240
    .line 241
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 242
    .line 243
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 244
    .line 245
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-virtual {p0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :cond_a
    invoke-virtual {p1}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    int-to-float p1, p1

    .line 266
    const v0, 0x3ef8ef35    # 0.4862f

    .line 267
    .line 268
    .line 269
    mul-float/2addr p1, v0

    .line 270
    float-to-int p1, p1

    .line 271
    iput p1, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 272
    .line 273
    iget p1, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 274
    .line 275
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 276
    .line 277
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    const v3, 0x7f070466

    .line 282
    .line 283
    .line 284
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    invoke-static {v0, v2}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    sub-int/2addr p1, v0

    .line 293
    iput p1, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 294
    .line 295
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->b:Landroid/app/Dialog;

    .line 296
    .line 297
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    invoke-virtual {p0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 302
    .line 303
    .line 304
    :cond_b
    :goto_1
    return-void
.end method

.method public r(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->c:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->d:Landroid/widget/Button;

    .line 6
    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/android/launcher3/helper/a;->h(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    goto/16 :goto_2

    .line 32
    .line 33
    :cond_1
    new-instance v0, Lcom/android/launcher3/helper/a$b;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/android/launcher3/helper/a;->e:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/android/launcher3/helper/a$b;-><init>(Ljava/util/ArrayList;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/launcher3/helper/a;->f:Lcom/android/launcher3/helper/a$b;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/helper/a;->c:Landroidx/viewpager/widget/ViewPager;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/a;)V

    .line 45
    .line 46
    .line 47
    const-string v0, "help_minors_mode"

    .line 48
    .line 49
    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->c:Landroidx/viewpager/widget/ViewPager;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 62
    .line 63
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 64
    .line 65
    iget-object v2, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    const v4, 0x7f070463

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-static {v2, v3}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 83
    .line 84
    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 85
    .line 86
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Lcom/android/launcher3/helper/a;->c:Landroidx/viewpager/widget/ViewPager;

    .line 90
    .line 91
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->f:Lcom/android/launcher3/helper/a$b;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/android/launcher3/helper/a$b;->d()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iget-object v1, p0, Lcom/android/launcher3/helper/a;->d:Landroid/widget/Button;

    .line 101
    .line 102
    new-instance v2, Lo1/b;

    .line 103
    .line 104
    invoke-direct {v2, p0, v0, p1}, Lo1/b;-><init>(Lcom/android/launcher3/helper/a;ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    .line 109
    .line 110
    const/4 p1, 0x1

    .line 111
    if-le v0, p1, :cond_4

    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/launcher3/helper/a;->g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 114
    .line 115
    invoke-virtual {v1, p1}, Lcom/android/launcher3/helper/DotsPageIndicatorZTE;->l(Z)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/android/launcher3/helper/a;->g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 119
    .line 120
    invoke-virtual {v1, v0}, Lcom/android/launcher3/helper/DotsPageIndicatorZTE;->setPageCount(I)V

    .line 121
    .line 122
    .line 123
    new-instance v1, Ljava/util/ArrayList;

    .line 124
    .line 125
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .line 127
    .line 128
    const/4 v2, 0x0

    .line 129
    move v3, v2

    .line 130
    :goto_0
    if-ge v3, v0, :cond_3

    .line 131
    .line 132
    invoke-direct {p0, v3}, Lcom/android/launcher3/helper/a;->f(I)Lcom/android/launcher3/helper/DotsPageIndicatorZTE$b;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    add-int/lit8 v3, v3, 0x1

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 143
    .line 144
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/helper/DotsPageIndicatorZTE;->b(Ljava/util/ArrayList;Z)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->a:Lcom/android/launcher3/C2;

    .line 148
    .line 149
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 158
    .line 159
    iget-object v0, p0, Lcom/android/launcher3/helper/a;->g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 160
    .line 161
    invoke-virtual {v0, p1}, Lcom/android/launcher3/helper/DotsPageIndicatorZTE;->setPageWidth(I)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 165
    .line 166
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 167
    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->g:Lcom/android/launcher3/helper/DotsPageIndicatorZTE;

    .line 171
    .line 172
    const/16 v0, 0x8

    .line 173
    .line 174
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 175
    .line 176
    .line 177
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/helper/a;->c:Landroidx/viewpager/widget/ViewPager;

    .line 178
    .line 179
    iget-object p0, p0, Lcom/android/launcher3/helper/a;->j:Landroidx/viewpager/widget/ViewPager$j;

    .line 180
    .line 181
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->c(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 182
    .line 183
    .line 184
    :cond_5
    :goto_2
    return-void
.end method
