.class public Lcom/android/launcher3/taskbar/J2;
.super Ljava/lang/Object;
.source "TaskbarHoverToolTipController.java"

# interfaces
.implements Landroid/view/View$OnHoverListener;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private final h:Lcom/android/launcher3/taskbar/TaskbarView;

.field private final i:Landroid/view/View;

.field private final j:Lcom/android/launcher3/views/q;

.field private final k:Ljava/lang/String;

.field private final l:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarView;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/J2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/J2;->h:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/J2;->i:Landroid/view/View;

    .line 9
    .line 10
    instance-of p2, p3, Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    check-cast p3, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    invoke-virtual {p3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iput-object p2, p0, Lcom/android/launcher3/taskbar/J2;->k:Ljava/lang/String;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    instance-of p2, p3, Lcom/android/launcher3/folder/FolderIcon;

    .line 28
    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    move-object p2, p3

    .line 32
    check-cast p2, Lcom/android/launcher3/folder/FolderIcon;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 37
    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    check-cast p3, Lcom/android/launcher3/folder/FolderIcon;

    .line 41
    .line 42
    iget-object p2, p3, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 45
    .line 46
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p0, Lcom/android/launcher3/taskbar/J2;->k:Ljava/lang/String;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    instance-of p2, p3, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 54
    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    check-cast p3, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 58
    .line 59
    invoke-virtual {p3}, Lcom/android/launcher3/apppairs/AppPairIcon;->getTitleTextView()Lcom/android/launcher3/BubbleTextView;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    iput-object p2, p0, Lcom/android/launcher3/taskbar/J2;->k:Ljava/lang/String;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 p2, 0x0

    .line 75
    iput-object p2, p0, Lcom/android/launcher3/taskbar/J2;->k:Ljava/lang/String;

    .line 76
    .line 77
    :goto_0
    new-instance p2, Landroid/view/ContextThemeWrapper;

    .line 78
    .line 79
    const p3, 0x7f15002b

    .line 80
    .line 81
    .line 82
    invoke-direct {p2, p1, p3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 83
    .line 84
    .line 85
    new-instance p1, Lcom/android/launcher3/views/q;

    .line 86
    .line 87
    const/4 p3, 0x0

    .line 88
    const v0, 0x7f0e0073

    .line 89
    .line 90
    .line 91
    invoke-direct {p1, p2, p3, v0}, Lcom/android/launcher3/views/q;-><init>(Landroid/content/Context;ZI)V

    .line 92
    .line 93
    .line 94
    iput-object p1, p0, Lcom/android/launcher3/taskbar/J2;->j:Lcom/android/launcher3/views/q;

    .line 95
    .line 96
    invoke-virtual {p2}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    const v0, 0x7f070bc1

    .line 101
    .line 102
    .line 103
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    invoke-virtual {p2}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const v1, 0x7f070bc0

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    const v1, 0x7f0b05e0

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1, v0, p3, v0, p3}, Landroid/view/View;->setPadding(IIII)V

    .line 126
    .line 127
    .line 128
    const/4 p3, 0x0

    .line 129
    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p2}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    const p3, 0x7f070bc2

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    iput p2, p0, Lcom/android/launcher3/taskbar/J2;->l:I

    .line 144
    .line 145
    new-instance p2, Landroid/animation/AnimatorSet;

    .line 146
    .line 147
    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 148
    .line 149
    .line 150
    sget-object p3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 151
    .line 152
    const/4 v0, 0x2

    .line 153
    new-array v0, v0, [F

    .line 154
    .line 155
    fill-array-data v0, :array_0

    .line 156
    .line 157
    .line 158
    invoke-static {p1, p3, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 159
    .line 160
    .line 161
    move-result-object p3

    .line 162
    invoke-virtual {p2, p3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 163
    .line 164
    .line 165
    const-wide/16 v0, 0xf

    .line 166
    .line 167
    invoke-virtual {p2, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1, p2}, Lcom/android/launcher3/views/q;->setCustomOpenAnimation(Landroid/animation/AnimatorSet;)V

    .line 171
    .line 172
    .line 173
    new-instance p2, Lcom/android/launcher3/taskbar/I2;

    .line 174
    .line 175
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/I2;-><init>(Lcom/android/launcher3/taskbar/J2;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    nop

    .line 183
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/J2;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/taskbar/J2;->b(Landroid/view/View;IIIIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/J2;->j:Lcom/android/launcher3/views/q;

    .line 2
    .line 3
    int-to-float p2, p5

    .line 4
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/taskbar/J2;->j:Lcom/android/launcher3/views/q;

    .line 8
    .line 9
    iget-object p2, p0, Lcom/android/launcher3/taskbar/J2;->h:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getTop()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget p0, p0, Lcom/android/launcher3/taskbar/J2;->l:I

    .line 16
    .line 17
    sub-int/2addr p2, p0

    .line 18
    sub-int/2addr p5, p3

    .line 19
    sub-int/2addr p2, p5

    .line 20
    int-to-float p0, p2

    .line 21
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->setY(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private c()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/J2;->i:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/J2;->k:Ljava/lang/String;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/J2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->S0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/J2;->i:Landroid/view/View;

    .line 20
    .line 21
    instance-of v1, v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    check-cast v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getIconVisible()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/taskbar/J2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 35
    .line 36
    const/4 v1, 0x3

    .line 37
    invoke-static {v0, v1}, Lcom/android/launcher3/a;->hasOpenView(Lcom/android/launcher3/views/k;I)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/J2;->i:Landroid/view/View;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/android/launcher3/N5;->u(Landroid/view/View;)Landroid/graphics/Rect;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, p0, Lcom/android/launcher3/taskbar/J2;->j:Lcom/android/launcher3/views/q;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/android/launcher3/taskbar/J2;->k:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v3, p0, Lcom/android/launcher3/taskbar/J2;->h:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 59
    .line 60
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getTop()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    iget p0, p0, Lcom/android/launcher3/taskbar/J2;->l:I

    .line 65
    .line 66
    sub-int/2addr v3, p0

    .line 67
    const/4 p0, 0x0

    .line 68
    invoke-virtual {v1, v2, v0, v3, p0}, Lcom/android/launcher3/views/q;->h0(Ljava/lang/String;IIZ)Lcom/android/launcher3/views/q;

    .line 69
    .line 70
    .line 71
    :cond_4
    :goto_0
    return-void
.end method


# virtual methods
.method public onHover(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/16 v0, 0xa

    .line 6
    .line 7
    const/16 v1, 0x40

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/taskbar/J2;->j:Lcom/android/launcher3/views/q;

    .line 13
    .line 14
    invoke-virtual {p1, v2}, Lcom/android/launcher3/a;->close(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/J2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 18
    .line 19
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/taskbar/I1;->g2(IZ)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/16 p2, 0x9

    .line 28
    .line 29
    if-ne p1, p2, :cond_1

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/J2;->c()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/taskbar/J2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/taskbar/I1;->g2(IZ)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return v2
.end method
