.class public Lcom/android/launcher3/menu/MenuWallpaper;
.super Landroid/widget/FrameLayout;
.source "MenuWallpaper.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/launcher3/H5$f;
.implements Lcom/android/launcher3/menu/c$a;


# static fields
.field private static l:J


# instance fields
.field private g:Landroid/widget/LinearLayout;

.field private h:Landroid/content/Context;

.field private i:Landroid/content/Intent;

.field private j:Lcom/android/launcher3/menu/MenuScroller;

.field private k:Lcom/android/launcher3/views/k;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/menu/MenuWallpaper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 4
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/views/k;

    iput-object p1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/menu/MenuWallpaper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuWallpaper;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/menu/MenuWallpaper;Lcom/android/launcher3/menu/MenuItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuWallpaper;->l(Lcom/android/launcher3/menu/MenuItemView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d(Ljava/util/List;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/launcher3/H5$j;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/menu/MenuScroller;->y0()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_4

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->L0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuWallpaper;->g()Lcom/android/launcher3/menu/MenuItemView;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuScroller;->i0(Lcom/android/launcher3/menu/MenuScroller$b;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->I0()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 50
    .line 51
    const-string v1, "default_wallpaper_gallery"

    .line 52
    .line 53
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-direct {p0, v1}, Lcom/android/launcher3/menu/MenuWallpaper;->e(Z)Lcom/android/launcher3/menu/MenuItemView;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuScroller;->i0(Lcom/android/launcher3/menu/MenuScroller$b;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lcom/android/launcher3/H5$j;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 81
    .line 82
    const v2, 0x7f0e0146

    .line 83
    .line 84
    .line 85
    const/4 v3, 0x0

    .line 86
    invoke-static {v1, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    check-cast v1, Lcom/android/launcher3/menu/MenuItemView;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/android/launcher3/H5$j;->a()Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/android/launcher3/H5$j;->b()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_2

    .line 108
    .line 109
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/android/launcher3/H5$j;->b()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v2, v1, v3}, Lcom/android/launcher3/menu/MenuScroller;->z0(Lcom/android/launcher3/menu/MenuScroller$b;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/H5$j;->d()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v1, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/android/launcher3/H5$j;->b()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v1, v0}, Lcom/android/launcher3/menu/MenuItemView;->setItemId(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    new-instance v0, Lcom/android/launcher3/menu/p;

    .line 136
    .line 137
    invoke-direct {v0, p0}, Lcom/android/launcher3/menu/p;-><init>(Lcom/android/launcher3/menu/MenuWallpaper;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuScroller;->i0(Lcom/android/launcher3/menu/MenuScroller$b;)V

    .line 146
    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuScroller;->x0()V

    .line 152
    .line 153
    .line 154
    :cond_4
    return-void
.end method

.method private e(Z)Lcom/android/launcher3/menu/MenuItemView;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 2
    .line 3
    const v1, 0x7f0e0146

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/menu/MenuItemView;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->R()Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const v2, 0x7f14025c

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Lcom/android/launcher3/menu/p;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Lcom/android/launcher3/menu/p;-><init>(Lcom/android/launcher3/menu/MenuWallpaper;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuItemView;->setShowCornerFlag(Z)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuItemView;->setFrontImageIsCornerFlag(Z)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const v3, 0x7f080a90

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuItemView;->setFrontImage(Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuItemView;->setText(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    const-string v1, "default_wallpaper_gallery"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuItemView;->setItemId(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    if-eqz p1, :cond_0

    .line 90
    .line 91
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/android/launcher3/menu/MenuItemView;->getItemId()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/menu/MenuScroller;->z0(Lcom/android/launcher3/menu/MenuScroller$b;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_0
    return-object v0
.end method

.method private g()Lcom/android/launcher3/menu/MenuItemView;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 2
    .line 3
    const v1, 0x7f0e0146

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/menu/MenuItemView;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getThemeRes()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const v3, 0x7f04049c

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v3, v2}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Lcom/android/launcher3/menu/p;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Lcom/android/launcher3/menu/p;-><init>(Lcom/android/launcher3/menu/MenuWallpaper;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const v2, 0x7f14025d

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lcom/android/launcher3/menu/MenuItemView;->setText(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const-string p0, "default_online_wallpaper"

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Lcom/android/launcher3/menu/MenuItemView;->setItemId(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-object v0
.end method

.method private h(Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/launcher3/H5$j;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/H5$g;->e()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "initItems-forceUpdate="

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, "--curSelectedWallpaperId="

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "MenuWallpaper"

    .line 45
    .line 46
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    const-string v0, ""

    .line 52
    .line 53
    :cond_0
    if-eqz p2, :cond_1

    .line 54
    .line 55
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/menu/MenuWallpaper;->d(Ljava/util/List;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/launcher3/menu/MenuWallpaper;->o(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private synthetic i()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuWallpaper;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l(Lcom/android/launcher3/menu/MenuItemView;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/H5$j;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/menu/MenuItemView;->getItemId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/H5$j;->c()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v0, ""

    .line 19
    .line 20
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v3, "onItemClick--itemId="

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v3, " - "

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const-string v4, "MenuWallpaper"

    .line 46
    .line 47
    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    const-string v2, "default_online_wallpaper"

    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->i:Landroid/content/Intent;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Lcom/android/launcher3/u4;->i()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    .line 82
    .line 83
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget-object p1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->i0(Lcom/android/launcher3/statemanager/a;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_1
    const-string v2, "default_wallpaper_gallery"

    .line 98
    .line 99
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_3

    .line 104
    .line 105
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 110
    .line 111
    .line 112
    move-result-wide v0

    .line 113
    sget-wide v2, Lcom/android/launcher3/menu/MenuWallpaper;->l:J

    .line 114
    .line 115
    sub-long v2, v0, v2

    .line 116
    .line 117
    const-wide/16 v4, 0x1f4

    .line 118
    .line 119
    cmp-long p1, v2, v4

    .line 120
    .line 121
    if-lez p1, :cond_2

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuWallpaper;->r()V

    .line 124
    .line 125
    .line 126
    sput-wide v0, Lcom/android/launcher3/menu/MenuWallpaper;->l:J

    .line 127
    .line 128
    :cond_2
    return-void

    .line 129
    :cond_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-nez v2, :cond_4

    .line 134
    .line 135
    const-string v2, "wallpaper"

    .line 136
    .line 137
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-eqz v2, :cond_4

    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 144
    .line 145
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H5;->z1(Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 157
    .line 158
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/menu/MenuScroller;->z0(Lcom/android/launcher3/menu/MenuScroller$b;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    const-string p1, "onItemClick itemId is invalid!"

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method private m(Lcom/android/launcher3/menu/MenuItemView;)V
    .locals 5

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    const-string v2, "scaleY"

    .line 8
    .line 9
    invoke-static {p1, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    .line 14
    .line 15
    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 19
    .line 20
    .line 21
    const-wide/16 v2, 0xc8

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    const-string v4, "scaleX"

    .line 27
    .line 28
    new-array v0, v0, [F

    .line 29
    .line 30
    fill-array-data v0, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v4, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    .line 38
    .line 39
    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    .line 48
    new-instance v2, Lcom/android/launcher3/menu/MenuWallpaper$a;

    .line 49
    .line 50
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/menu/MenuWallpaper$a;-><init>(Lcom/android/launcher3/menu/MenuWallpaper;Lcom/android/launcher3/menu/MenuItemView;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 57
    .line 58
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 59
    .line 60
    .line 61
    const/4 p1, 0x2

    .line 62
    new-array p1, p1, [Landroid/animation/Animator;

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    aput-object v0, p1, v2

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    aput-object v1, p1, v0

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private n(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "wallpaper"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H5;->e0(Ljava/lang/String;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/menu/MenuWallpaper;->h(Ljava/util/List;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private o(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/menu/MenuScroller;->getChild()Landroid/widget/LinearLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    if-ge v2, v1, :cond_3

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Lcom/android/launcher3/menu/MenuItemView;

    .line 21
    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    invoke-virtual {v3}, Lcom/android/launcher3/menu/MenuItemView;->getItemId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    iget-object v4, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/android/launcher3/menu/MenuItemView;->getItemId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    invoke-virtual {v4, v3, v5}, Lcom/android/launcher3/menu/MenuScroller;->z0(Lcom/android/launcher3/menu/MenuScroller$b;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    const-string v4, "default_wallpaper_gallery"

    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/android/launcher3/menu/MenuItemView;->getItemId()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_2

    .line 55
    .line 56
    iget-object v4, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 57
    .line 58
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v4}, Lcom/android/launcher3/H5;->R()Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    return-void
.end method

.method private t()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, -0x1

    .line 20
    const/4 v4, 0x0

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 24
    .line 25
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 26
    .line 27
    invoke-virtual {v0, v4, v4, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 31
    .line 32
    const/4 v2, 0x2

    .line 33
    invoke-virtual {v1, v2}, Lcom/android/launcher3/menu/a;->setScrollOrientation(I)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->n()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const v2, 0x7f070a44

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {v0, v4, v1, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 64
    .line 65
    const/4 v2, 0x1

    .line 66
    invoke-virtual {v1, v2}, Lcom/android/launcher3/menu/a;->setScrollOrientation(I)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method


# virtual methods
.method public K(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onViewExisted-wallpaper "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "MenuWallpaper"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuWallpaper;->s()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/menu/MenuScroller;->y0()V

    .line 29
    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 40
    .line 41
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    .line 48
    .line 49
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 p1, 0x1

    .line 58
    invoke-virtual {p0, p1, p1}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuWallpaper;->n(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(ILandroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    const-string v0, "MenuWallpaper"

    .line 2
    .line 3
    const-string v1, "initMenuData for wallpaper"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p0}, Lcom/android/launcher3/H5;->r1(Lcom/android/launcher3/H5$f;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "wallpaper"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H5;->Z(Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->i:Landroid/content/Intent;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H5;->e0(Ljava/lang/String;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x1

    .line 54
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/menu/MenuWallpaper;->h(Ljava/util/List;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public k(I)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/menu/MenuScroller;->getChild()Landroid/widget/LinearLayout;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const-string p0, "MenuWallpaper"

    .line 10
    .line 11
    const-string p1, "onForeColorChanged found no container "

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ge v0, v1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/android/launcher3/menu/MenuItemView;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/android/launcher3/menu/MenuItemView;->getItemId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "default_wallpaper_gallery"

    .line 35
    .line 36
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->R()Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    const-string v2, "default_online_wallpaper"

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/android/launcher3/menu/MenuItemView;->getItemId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 73
    .line 74
    iget-object v3, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    .line 75
    .line 76
    invoke-static {v3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getThemeRes()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    const v4, 0x7f04049c

    .line 85
    .line 86
    .line 87
    invoke-static {v2, v4, v3}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    :goto_1
    invoke-virtual {v1}, Lcom/android/launcher3/menu/MenuItemView;->e()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-virtual {v1, v2}, Lcom/android/launcher3/menu/MenuItemView;->setIsSelected(Z)V

    .line 102
    .line 103
    .line 104
    add-int/lit8 v0, v0, 0x1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onClick:menuContainier infos : "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "MenuWallpaper"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    instance-of v0, p1, Lcom/android/launcher3/menu/MenuItemView;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    check-cast p1, Lcom/android/launcher3/menu/MenuItemView;

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuWallpaper;->m(Lcom/android/launcher3/menu/MenuItemView;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuWallpaper;->t()V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuWallpaper;->n(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 5
    .line 6
    const v1, 0x7f0e0144

    .line 7
    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/LinearLayout;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->g:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->g:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    const v1, 0x7f0b03ab

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/android/launcher3/menu/MenuScroller;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 33
    .line 34
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuWallpaper;->t()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public p(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onViewEntered-wallpaper "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "MenuWallpaper"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x1

    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/android/launcher3/menu/o;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/launcher3/menu/o;-><init>(Lcom/android/launcher3/menu/MenuWallpaper;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method r()V
    .locals 3

    .line 1
    const-string v0, "MenuWallpaper"

    .line 2
    .line 3
    const-string v1, "showGallery"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->S()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->h:Landroid/content/Context;

    .line 23
    .line 24
    check-cast v1, Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const v2, 0x7f140458

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {v0, p0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/16 v0, 0xd

    .line 42
    .line 43
    invoke-virtual {v1, p0, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method s()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuWallpaper;->k:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 22
    .line 23
    const/16 v0, 0x21

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/a;->u(I)Z

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 32
    .line 33
    const/16 v0, 0x42

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/a;->t(I)Z

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper;->j:Lcom/android/launcher3/menu/MenuScroller;

    .line 40
    .line 41
    const/16 v0, 0x11

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/a;->t(I)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method
