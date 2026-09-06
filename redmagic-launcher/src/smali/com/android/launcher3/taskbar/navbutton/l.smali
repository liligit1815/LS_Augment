.class public final Lcom/android/launcher3/taskbar/navbutton/l;
.super Lcom/android/launcher3/taskbar/navbutton/j;
.source "PhoneSeascapeNavLayoutter.kt"


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V
    .locals 1

    .line 1
    const-string v0, "resources"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "navBarContainer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "endContextualContainer"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "startContextualContainer"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct/range {p0 .. p7}, Lcom/android/launcher3/taskbar/navbutton/j;-><init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public o()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->d()Landroid/widget/ImageView;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->j()Landroid/widget/ImageView;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public p(I)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v1, 0x7f070ba7

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const v2, 0x7f070ba5

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    add-int v5, v0, v1

    .line 42
    .line 43
    const/4 v6, 0x0

    .line 44
    const/16 v7, 0x30

    .line 45
    .line 46
    move-object v2, p0

    .line 47
    move v4, p1

    .line 48
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/taskbar/navbutton/j;->n(Landroid/view/ViewGroup;IIII)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const/4 v7, 0x0

    .line 56
    const/16 v9, 0x50

    .line 57
    .line 58
    move v6, v4

    .line 59
    move v8, v5

    .line 60
    move-object v5, p0

    .line 61
    move-object v4, v2

    .line 62
    invoke-virtual/range {v4 .. v9}, Lcom/android/launcher3/taskbar/navbutton/j;->n(Landroid/view/ViewGroup;IIII)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->l()Landroid/widget/Space;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const/4 v0, -0x1

    .line 74
    invoke-virtual {p0, p1, v0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    if-eqz p0, :cond_0

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    .line 104
    .line 105
    :cond_0
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    if-eqz p0, :cond_1

    .line 110
    .line 111
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    :cond_1
    return-void
.end method
