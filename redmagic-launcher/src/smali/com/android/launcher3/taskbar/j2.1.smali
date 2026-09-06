.class public Lcom/android/launcher3/taskbar/j2;
.super Lcom/android/launcher3/dragndrop/j;
.source "TaskbarDragController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/j2$f;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/dragndrop/j<",
        "Lcom/android/launcher3/taskbar/b;",
        ">;",
        "Lcom/android/launcher3/taskbar/R1$b;"
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:Z

.field private D:Z

.field private E:Landroid/animation/ValueAnimator;

.field private F:Z

.field private G:Z

.field private final x:I

.field private final y:[I

.field z:Lcom/android/launcher3/taskbar/R1;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/b;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/j;-><init>(Lcom/android/launcher3/views/k;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    new-array p1, p1, [I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2;->y:[I

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    check-cast p1, Lcom/android/launcher3/taskbar/b;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const v0, 0x7f070b98

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lcom/android/launcher3/taskbar/j2;->x:I

    .line 25
    .line 26
    return-void
.end method

.method private B0(FFLandroid/view/View;Lcom/android/launcher3/taskbar/j2$f;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0, p3}, Lcom/android/launcher3/taskbar/j2;->k0(Landroid/view/View;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getLocationOnScreen()[I

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    instance-of v2, v0, Lcom/android/launcher3/BubbleTextView;

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    new-instance v1, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 28
    .line 29
    .line 30
    move-object v2, v0

    .line 31
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Lcom/android/launcher3/BubbleTextView;->g(Landroid/graphics/Rect;)V

    .line 34
    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    aget v3, v4, v2

    .line 38
    .line 39
    iget v5, v1, Landroid/graphics/Rect;->left:I

    .line 40
    .line 41
    add-int/2addr v3, v5

    .line 42
    aput v3, v4, v2

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    aget v3, v4, v2

    .line 46
    .line 47
    iget v5, v1, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    add-int/2addr v3, v5

    .line 50
    aput v3, v4, v2

    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    int-to-float v1, v1

    .line 57
    :cond_1
    iget v2, p0, Lcom/android/launcher3/taskbar/j2;->x:I

    .line 58
    .line 59
    int-to-float v2, v2

    .line 60
    div-float v6, v1, v2

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    const/high16 v2, 0x3f800000    # 1.0f

    .line 64
    .line 65
    if-ne v0, p3, :cond_2

    .line 66
    .line 67
    move v7, v2

    .line 68
    goto :goto_0

    .line 69
    :cond_2
    move v7, v1

    .line 70
    :goto_0
    new-instance v1, Lcom/android/launcher3/taskbar/j2$e;

    .line 71
    .line 72
    move-object v2, p0

    .line 73
    move v3, p1

    .line 74
    move v5, p2

    .line 75
    move-object v8, p4

    .line 76
    invoke-direct/range {v1 .. v8}, Lcom/android/launcher3/taskbar/j2$e;-><init>(Lcom/android/launcher3/taskbar/j2;F[IFFFLcom/android/launcher3/taskbar/j2$f;)V

    .line 77
    .line 78
    .line 79
    const/4 p0, 0x2

    .line 80
    new-array p0, p0, [F

    .line 81
    .line 82
    fill-array-data p0, :array_0

    .line 83
    .line 84
    .line 85
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iput-object p0, v2, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 90
    .line 91
    const-wide/16 p1, 0x12c

    .line 92
    .line 93
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 94
    .line 95
    .line 96
    iget-object p0, v2, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 97
    .line 98
    sget-object p1, LJ0/h;->r:Landroid/view/animation/Interpolator;

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 101
    .line 102
    .line 103
    iget-object p0, v2, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 104
    .line 105
    invoke-virtual {p0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private D0(Landroid/view/View;Ln1/d;Landroid/graphics/Point;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/views/s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/views/s;

    .line 6
    .line 7
    invoke-interface {p1}, Lcom/android/launcher3/views/s;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j2;->G:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const-string v0, "Main"

    .line 21
    .line 22
    const-string v1, "onTaskbarItemLongClick"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    check-cast v0, Lcom/android/launcher3/taskbar/b;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b;->h()V

    .line 34
    .line 35
    .line 36
    new-instance v0, Lcom/android/launcher3/taskbar/Z1;

    .line 37
    .line 38
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/Z1;-><init>(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/BubbleTextView;Ln1/d;Landroid/graphics/Point;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 47
    return p0
.end method

.method private F0(Lcom/android/launcher3/BubbleTextView;Ln1/d;)Lcom/android/launcher3/dragndrop/v;
    .locals 12

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ls1/o;->d()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    :goto_0
    invoke-virtual {p1}, Landroid/widget/TextView;->clearFocus()V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setPressed(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->M()V

    .line 26
    .line 27
    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    new-instance v4, Ln1/d;

    .line 31
    .line 32
    invoke-direct {v4, p1}, Ln1/d;-><init>(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    :goto_1
    move v5, v1

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    move-object v4, p2

    .line 38
    goto :goto_1

    .line 39
    :goto_2
    invoke-virtual {v4}, Ln1/d;->f()Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v6, p0, Lcom/android/launcher3/taskbar/j2;->y:[I

    .line 44
    .line 45
    invoke-virtual {v4, v1, v6}, Ln1/d;->m(Landroid/graphics/drawable/Drawable;[I)F

    .line 46
    .line 47
    .line 48
    move-result v10

    .line 49
    iget-object v4, p0, Lcom/android/launcher3/taskbar/j2;->y:[I

    .line 50
    .line 51
    aget v6, v4, v2

    .line 52
    .line 53
    const/4 v7, 0x1

    .line 54
    aget v4, v4, v7

    .line 55
    .line 56
    new-instance v8, Landroid/graphics/Rect;

    .line 57
    .line 58
    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v8}, Lcom/android/launcher3/BubbleTextView;->g(Landroid/graphics/Rect;)V

    .line 62
    .line 63
    .line 64
    iget v7, v8, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    add-int/2addr v4, v7

    .line 67
    new-instance v11, Lcom/android/launcher3/dragndrop/p;

    .line 68
    .line 69
    invoke-direct {v11}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 70
    .line 71
    .line 72
    iget-object v7, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 73
    .line 74
    iget-object v7, v7, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 75
    .line 76
    invoke-virtual {v7, p1}, Lcom/android/launcher3/taskbar/allapps/c;->c(Landroid/view/View;)Lcom/android/launcher3/dragndrop/p$a;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    iput-object v7, v11, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 81
    .line 82
    if-nez v7, :cond_2

    .line 83
    .line 84
    iget-object v7, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 85
    .line 86
    iget-object v7, v7, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 87
    .line 88
    invoke-virtual {v7, p1}, Lcom/android/launcher3/taskbar/z3;->C(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    if-eqz v7, :cond_2

    .line 93
    .line 94
    invoke-virtual {v7, v2}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->a0(Z)Lcom/android/launcher3/dragndrop/p$a;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iput-object v2, v11, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 99
    .line 100
    :cond_2
    iget-object v2, v11, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 101
    .line 102
    if-nez v2, :cond_3

    .line 103
    .line 104
    new-instance v2, Lcom/android/launcher3/taskbar/j2$a;

    .line 105
    .line 106
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/j2$a;-><init>(Lcom/android/launcher3/taskbar/j2;)V

    .line 107
    .line 108
    .line 109
    iput-object v2, v11, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 110
    .line 111
    :cond_3
    iget-object v2, v11, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 112
    .line 113
    invoke-interface {v2}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    iget v7, v2, Landroid/graphics/Point;->x:I

    .line 118
    .line 119
    add-int/2addr v6, v7

    .line 120
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 121
    .line 122
    add-int/2addr v4, v2

    .line 123
    move v2, v5

    .line 124
    move v5, v4

    .line 125
    move v4, v6

    .line 126
    new-instance v6, Lcom/android/launcher3/taskbar/e2;

    .line 127
    .line 128
    invoke-direct {v6, p0}, Lcom/android/launcher3/taskbar/e2;-><init>(Lcom/android/launcher3/taskbar/j2;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v7

    .line 135
    instance-of v9, v7, Lcom/android/launcher3/model/data/y;

    .line 136
    .line 137
    if-eqz v9, :cond_4

    .line 138
    .line 139
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_4
    const/4 v7, 0x0

    .line 143
    :goto_3
    mul-float v9, v10, v2

    .line 144
    .line 145
    const/4 v2, 0x0

    .line 146
    move-object v0, p0

    .line 147
    move-object v3, p1

    .line 148
    invoke-virtual/range {v0 .. v11}, Lcom/android/launcher3/taskbar/j2;->P(Landroid/graphics/drawable/Drawable;Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    return-object v0
.end method

.method private G0(Lcom/android/launcher3/BubbleTextView;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Lcom/android/launcher3/taskbar/j2$b;

    .line 6
    .line 7
    invoke-direct {v2, v0, v1, v1}, Lcom/android/launcher3/taskbar/j2$b;-><init>(Lcom/android/launcher3/taskbar/j2;Landroid/view/View;Lcom/android/launcher3/BubbleTextView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    instance-of v4, v3, Lcom/android/launcher3/model/data/y;

    .line 15
    .line 16
    const-string v5, "android.intent.extra.USER"

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    if-eqz v4, :cond_4

    .line 20
    .line 21
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    iget-object v4, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    check-cast v4, Lcom/android/launcher3/taskbar/b;

    .line 26
    .line 27
    const-class v7, Landroid/content/pm/LauncherApps;

    .line 28
    .line 29
    invoke-virtual {v4, v7}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Landroid/content/pm/LauncherApps;

    .line 34
    .line 35
    new-instance v7, Landroid/content/ClipDescription;

    .line 36
    .line 37
    iget-object v8, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 38
    .line 39
    iget v9, v3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 40
    .line 41
    const/4 v10, 0x6

    .line 42
    if-ne v9, v10, :cond_0

    .line 43
    .line 44
    const-string v9, "application/vnd.android.shortcut"

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const-string v9, "application/vnd.android.activity"

    .line 48
    .line 49
    :goto_0
    filled-new-array {v9}, [Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v9

    .line 53
    invoke-direct {v7, v8, v9}, Landroid/content/ClipDescription;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    new-instance v8, Landroid/content/Intent;

    .line 57
    .line 58
    invoke-direct {v8}, Landroid/content/Intent;-><init>()V

    .line 59
    .line 60
    .line 61
    iget v9, v3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 62
    .line 63
    const-string v11, "android.intent.extra.PENDING_INTENT"

    .line 64
    .line 65
    if-ne v9, v10, :cond_1

    .line 66
    .line 67
    move-object v9, v3

    .line 68
    check-cast v9, Lcom/android/launcher3/model/data/I;

    .line 69
    .line 70
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v10

    .line 74
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    move-result-object v12

    .line 78
    invoke-virtual {v12}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v12

    .line 82
    iget-object v13, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 83
    .line 84
    invoke-virtual {v4, v12, v10, v6, v13}, Landroid/content/pm/LauncherApps;->getShortcutIntent(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v8, v11, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-virtual {v4}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    const-string v11, "android.intent.extra.PACKAGE_NAME"

    .line 100
    .line 101
    invoke-virtual {v8, v11, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 102
    .line 103
    .line 104
    const-string v4, "android.intent.extra.shortcut.ID"

    .line 105
    .line 106
    invoke-virtual {v8, v4, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/I;->R()Landroid/content/pm/ShortcutInfo;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-static {}, LN2/g;->c()Z

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    if-eqz v9, :cond_3

    .line 118
    .line 119
    if-eqz v4, :cond_3

    .line 120
    .line 121
    const-string v9, "EXTRA_SHORTCUT_INFO"

    .line 122
    .line 123
    invoke-virtual {v8, v9, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_1
    const/16 v10, 0x9

    .line 128
    .line 129
    if-ne v9, v10, :cond_2

    .line 130
    .line 131
    iget-object v4, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 132
    .line 133
    move-object v12, v4

    .line 134
    check-cast v12, Landroid/content/Context;

    .line 135
    .line 136
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 137
    .line 138
    .line 139
    move-result-object v14

    .line 140
    const/16 v16, 0x0

    .line 141
    .line 142
    iget-object v4, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 143
    .line 144
    const/4 v13, 0x0

    .line 145
    const/high16 v15, 0xa000000

    .line 146
    .line 147
    move-object/from16 v17, v4

    .line 148
    .line 149
    invoke-static/range {v12 .. v17}, Landroid/app/PendingIntent;->getActivityAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    invoke-virtual {v8, v11, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_2
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 158
    .line 159
    .line 160
    move-result-object v9

    .line 161
    invoke-virtual {v9}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 162
    .line 163
    .line 164
    move-result-object v9

    .line 165
    iget-object v10, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 166
    .line 167
    invoke-virtual {v4, v9, v6, v10}, Landroid/content/pm/LauncherApps;->getMainActivityLaunchIntent(Landroid/content/ComponentName;Landroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    .line 168
    .line 169
    .line 170
    move-result-object v4

    .line 171
    invoke-virtual {v8, v11, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 172
    .line 173
    .line 174
    :cond_3
    :goto_1
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 175
    .line 176
    invoke-virtual {v8, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 177
    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_4
    instance-of v4, v3, Lcom/android/quickstep/util/SingleTask;

    .line 181
    .line 182
    if-eqz v4, :cond_5

    .line 183
    .line 184
    check-cast v3, Lcom/android/quickstep/util/SingleTask;

    .line 185
    .line 186
    invoke-virtual {v3}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    new-instance v7, Landroid/content/ClipDescription;

    .line 191
    .line 192
    iget-object v4, v3, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 193
    .line 194
    const-string v8, "application/vnd.android.task"

    .line 195
    .line 196
    filled-new-array {v8}, [Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v8

    .line 200
    invoke-direct {v7, v4, v8}, Landroid/content/ClipDescription;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    new-instance v8, Landroid/content/Intent;

    .line 204
    .line 205
    invoke-direct {v8}, Landroid/content/Intent;-><init>()V

    .line 206
    .line 207
    .line 208
    iget-object v4, v3, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 209
    .line 210
    iget v4, v4, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 211
    .line 212
    const-string v9, "android.intent.extra.TASK_ID"

    .line 213
    .line 214
    invoke-virtual {v8, v9, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 215
    .line 216
    .line 217
    iget-object v3, v3, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 218
    .line 219
    iget v3, v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 220
    .line 221
    invoke-static {v3}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-virtual {v8, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 226
    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_5
    move-object v7, v6

    .line 230
    move-object v8, v7

    .line 231
    :goto_2
    if-eqz v7, :cond_7

    .line 232
    .line 233
    if-eqz v8, :cond_7

    .line 234
    .line 235
    invoke-static {}, Lcom/android/quickstep/util/LogUtils;->getShellShareableInstanceId()Landroid/util/Pair;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 240
    .line 241
    check-cast v4, Lcom/android/internal/logging/InstanceId;

    .line 242
    .line 243
    iget-object v3, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 244
    .line 245
    check-cast v3, Lcom/android/launcher3/logging/d;

    .line 246
    .line 247
    const-string v5, "android.intent.extra.LOGGING_INSTANCE_ID"

    .line 248
    .line 249
    invoke-virtual {v8, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 250
    .line 251
    .line 252
    iget-object v4, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 253
    .line 254
    check-cast v4, Lcom/android/launcher3/taskbar/b;

    .line 255
    .line 256
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/b;->c()Z

    .line 257
    .line 258
    .line 259
    move-result v4

    .line 260
    if-eqz v4, :cond_6

    .line 261
    .line 262
    iget-object v4, v0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 263
    .line 264
    iget-object v4, v4, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 265
    .line 266
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getLocationOnScreen()[I

    .line 271
    .line 272
    .line 273
    move-result-object v5

    .line 274
    new-instance v9, Landroid/graphics/RectF;

    .line 275
    .line 276
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->getLastDrawnTransientRect()Landroid/graphics/RectF;

    .line 277
    .line 278
    .line 279
    move-result-object v4

    .line 280
    invoke-direct {v9, v4}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 281
    .line 282
    .line 283
    const/4 v4, 0x0

    .line 284
    aget v4, v5, v4

    .line 285
    .line 286
    int-to-float v4, v4

    .line 287
    const/4 v10, 0x1

    .line 288
    aget v5, v5, v10

    .line 289
    .line 290
    int-to-float v5, v5

    .line 291
    invoke-virtual {v9, v4, v5}, Landroid/graphics/RectF;->offset(FF)V

    .line 292
    .line 293
    .line 294
    const-string v4, "DISALLOW_HIT_REGION"

    .line 295
    .line 296
    invoke-virtual {v8, v4, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 297
    .line 298
    .line 299
    :cond_6
    new-instance v4, Landroid/content/ClipData;

    .line 300
    .line 301
    new-instance v5, Landroid/content/ClipData$Item;

    .line 302
    .line 303
    invoke-direct {v5, v8}, Landroid/content/ClipData$Item;-><init>(Landroid/content/Intent;)V

    .line 304
    .line 305
    .line 306
    invoke-direct {v4, v7, v5}, Landroid/content/ClipData;-><init>(Landroid/content/ClipDescription;Landroid/content/ClipData$Item;)V

    .line 307
    .line 308
    .line 309
    const/16 v5, 0xb00

    .line 310
    .line 311
    invoke-virtual {v1, v4, v2, v6, v5}, Landroid/widget/TextView;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    if-eqz v2, :cond_7

    .line 316
    .line 317
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/taskbar/j2;->y0(Lcom/android/launcher3/BubbleTextView;)V

    .line 318
    .line 319
    .line 320
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 321
    .line 322
    check-cast v1, Lcom/android/launcher3/taskbar/b;

    .line 323
    .line 324
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 325
    .line 326
    .line 327
    move-result-object v1

    .line 328
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    iget-object v2, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 333
    .line 334
    iget-object v2, v2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 335
    .line 336
    invoke-interface {v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 337
    .line 338
    .line 339
    move-result-object v1

    .line 340
    invoke-interface {v1, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->o:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 345
    .line 346
    invoke-interface {v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 347
    .line 348
    .line 349
    :cond_7
    iget-object v0, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 350
    .line 351
    invoke-static {v0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 352
    .line 353
    .line 354
    return-void
.end method

.method public static synthetic T(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/BubbleTextView;Landroid/view/View;Landroid/view/DragEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/j2;->q0(Lcom/android/launcher3/BubbleTextView;Landroid/view/View;Landroid/view/DragEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic U(Lcom/android/launcher3/taskbar/j2;Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/j2;->s0(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;FFFF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p4, p4}, Landroid/view/SurfaceControl$Transaction;->setScale(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1, p5}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic W(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->i1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic X(Lcom/android/launcher3/dragndrop/v;FFFF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p4}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic Y(Lcom/android/launcher3/taskbar/bubbles/m0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->K0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->h1()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic Z(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a0(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/j2;->o0(Lcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b0(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/j2;->p0(Lcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c0(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/BubbleTextView;Ln1/d;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/j2;->r0(Lcom/android/launcher3/BubbleTextView;Ln1/d;Landroid/graphics/Point;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d0(Lcom/android/launcher3/taskbar/j2;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/j2;->x:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e0(Lcom/android/launcher3/taskbar/j2;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/j2;->A:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f0(Lcom/android/launcher3/taskbar/j2;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/j2;->B:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g0(Lcom/android/launcher3/taskbar/j2;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h0(Lcom/android/launcher3/taskbar/j2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j2;->t0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic i0(Lcom/android/launcher3/taskbar/j2;)Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method

.method private j0(Lcom/android/launcher3/BubbleTextView;Landroid/view/DragEvent;)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Landroid/view/DragEvent;->getDragSurface()Landroid/view/SurfaceControl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/j2;->k0(Landroid/view/View;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p2}, Landroid/view/DragEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p2}, Landroid/view/DragEvent;->getOffsetX()F

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    sub-float/2addr v2, v3

    .line 18
    invoke-virtual {p2}, Landroid/view/DragEvent;->getY()F

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {p2}, Landroid/view/DragEvent;->getOffsetY()F

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    sub-float/2addr v3, p2

    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance v1, Landroid/view/SurfaceControl$Transaction;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v4, Lcom/android/launcher3/taskbar/h2;

    .line 37
    .line 38
    invoke-direct {v4, v1, v0}, Lcom/android/launcher3/taskbar/h2;-><init>(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, v2, v3, p1, v4}, Lcom/android/launcher3/taskbar/j2;->B0(FFLandroid/view/View;Lcom/android/launcher3/taskbar/j2$f;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    new-instance v2, Lcom/android/launcher3/taskbar/j2$d;

    .line 47
    .line 48
    invoke-direct {v2, p0, v1, v0, p2}, Lcom/android/launcher3/taskbar/j2$d;-><init>(Lcom/android/launcher3/taskbar/j2;Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/view/ViewRootImpl;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private k0(Landroid/view/View;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 8
    .line 9
    instance-of v2, v0, Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    if-eqz v2, :cond_4

    .line 12
    .line 13
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    iget v2, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 16
    .line 17
    const/16 v3, -0x68

    .line 18
    .line 19
    if-eq v2, v3, :cond_2

    .line 20
    .line 21
    const/16 v3, -0x66

    .line 22
    .line 23
    if-eq v2, v3, :cond_2

    .line 24
    .line 25
    invoke-static {v0}, Lcom/android/launcher3/taskbar/j2;->m0(Lcom/android/launcher3/model/data/y;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget p0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 33
    .line 34
    if-ltz p0, :cond_1

    .line 35
    .line 36
    iget p0, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 37
    .line 38
    filled-new-array {p0}, [I

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Lcom/android/launcher3/util/z0;->wrap([I)Lcom/android/launcher3/util/z0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Lcom/android/launcher3/util/P0;->q(Lcom/android/launcher3/util/z0;)Ljava/util/function/Predicate;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Lcom/android/launcher3/util/P0;->n(Ljava/util/function/Predicate;)Ljava/util/function/Predicate;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v1, p0}, Lcom/android/launcher3/taskbar/W4;->M(Ljava/util/function/Predicate;)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_1
    iget p0, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 60
    .line 61
    const/4 v2, 0x6

    .line 62
    if-ne p0, v2, :cond_4

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 73
    .line 74
    invoke-static {p0, p1}, Lcom/android/launcher3/util/P0;->t(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v1, p0}, Lcom/android/launcher3/taskbar/W4;->M(Ljava/util/function/Predicate;)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :cond_2
    :goto_0
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/j2;->F:Z

    .line 84
    .line 85
    if-eqz p0, :cond_3

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/W4;->J()Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_4
    :goto_1
    return-object p1
.end method

.method private static m0(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getContainerCase()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;->EXTENDED_CONTAINERS:Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$ContainerCase;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->getExtendedContainers()Lcom/android/launcher3/logger/d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/logger/d;->b()Lcom/android/launcher3/logger/d$b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/android/launcher3/logger/d$b;->h:Lcom/android/launcher3/logger/d$b;

    .line 22
    .line 23
    if-ne p0, v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private synthetic o0(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->D(Lcom/android/launcher3/dragndrop/j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic p0(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->n1(Lcom/android/launcher3/dragndrop/j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic q0(Lcom/android/launcher3/BubbleTextView;Landroid/view/View;Landroid/view/DragEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p3}, Landroid/view/DragEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p2, v0, :cond_2

    .line 7
    .line 8
    const/4 v1, 0x4

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eq p2, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/j2;->C:Z

    .line 14
    .line 15
    invoke-virtual {p3}, Landroid/view/DragEvent;->getResult()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j2;->t0()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/taskbar/j2;->j0(Lcom/android/launcher3/BubbleTextView;Landroid/view/DragEvent;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j2;->u0()V

    .line 29
    .line 30
    .line 31
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 32
    .line 33
    check-cast p0, Lcom/android/launcher3/taskbar/b;

    .line 34
    .line 35
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 p1, 0x0

    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    return v0
.end method

.method private synthetic r0(Lcom/android/launcher3/BubbleTextView;Ln1/d;Landroid/graphics/Point;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/j2;->F0(Lcom/android/launcher3/BubbleTextView;Ln1/d;)Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget v0, p3, Landroid/graphics/Point;->x:I

    .line 8
    .line 9
    neg-int v0, v0

    .line 10
    iget p3, p3, Landroid/graphics/Point;->y:I

    .line 11
    .line 12
    neg-int p3, p3

    .line 13
    invoke-virtual {p2, v0, p3}, Lcom/android/launcher3/dragndrop/v;->l(II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p2, 0x1

    .line 17
    invoke-virtual {p1, p2}, Lcom/android/launcher3/BubbleTextView;->setIconDisabled(Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 23
    .line 24
    const/4 p1, 0x2

    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic s0(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    iput-boolean p3, p0, Lcom/android/launcher3/taskbar/j2;->D:Z

    .line 2
    .line 3
    return-void
.end method

.method private t0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/j2;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 10
    .line 11
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/BubbleTextView;->setIconDisabled(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 26
    .line 27
    check-cast v0, Lcom/android/launcher3/taskbar/b;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b;->f()V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j2;->v0()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    xor-int/2addr v0, v2

    .line 46
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/taskbar/a4;->O0(ZZ)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 50
    .line 51
    check-cast v0, Lcom/android/launcher3/taskbar/b;

    .line 52
    .line 53
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 64
    .line 65
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->m:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 70
    .line 71
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method private u0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/f2;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/f2;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private v0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/b2;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/b2;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method private y0(Lcom/android/launcher3/BubbleTextView;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/j2;->C:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/taskbar/b;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/android/launcher3/taskbar/a2;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/a2;-><init>(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/BubbleTextView;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public A0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j2;->G:Z

    .line 2
    .line 3
    return-void
.end method

.method public C0(Landroid/view/View;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0, v0}, Lcom/android/launcher3/taskbar/j2;->D0(Landroid/view/View;Ln1/d;Landroid/graphics/Point;)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method protected D(Landroid/view/MotionEvent;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method protected E(Landroid/view/MotionEvent;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method protected E0(Lcom/android/launcher3/shortcuts/DeepShortcutView;Landroid/graphics/Point;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, LN1/d;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {v1, p1, p2}, LN1/d;-><init>(Landroid/view/View;Landroid/graphics/Point;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v0, v1, p2}, Lcom/android/launcher3/taskbar/j2;->D0(Landroid/view/View;Ln1/d;Landroid/graphics/Point;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public G()Z
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/j2;->C:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method protected P(Landroid/graphics/drawable/Drawable;Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p7

    .line 4
    .line 5
    move-object/from16 v2, p8

    .line 6
    .line 7
    iget-object v3, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    check-cast v3, Lcom/android/launcher3/taskbar/b;

    .line 10
    .line 11
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 12
    .line 13
    .line 14
    move-object/from16 v3, p11

    .line 15
    .line 16
    iput-object v3, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 17
    .line 18
    iget-object v3, v0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 19
    .line 20
    iget v4, v3, Landroid/graphics/Point;->x:I

    .line 21
    .line 22
    sub-int v4, v4, p4

    .line 23
    .line 24
    iput v4, v0, Lcom/android/launcher3/taskbar/j2;->A:I

    .line 25
    .line 26
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 27
    .line 28
    sub-int v3, v3, p5

    .line 29
    .line 30
    iput v3, v0, Lcom/android/launcher3/taskbar/j2;->B:I

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    move v4, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget v4, v2, Landroid/graphics/Rect;->left:I

    .line 38
    .line 39
    :goto_0
    if-nez v2, :cond_1

    .line 40
    .line 41
    move v5, v3

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget v5, v2, Landroid/graphics/Rect;->top:I

    .line 44
    .line 45
    :goto_1
    const/4 v6, 0x0

    .line 46
    iput-object v6, v0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 47
    .line 48
    new-instance v7, Lcom/android/launcher3/n0$a;

    .line 49
    .line 50
    iget-object v8, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 51
    .line 52
    check-cast v8, Lcom/android/launcher3/taskbar/b;

    .line 53
    .line 54
    invoke-virtual {v8}, Landroid/view/ContextThemeWrapper;->getApplicationContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    invoke-direct {v7, v8}, Lcom/android/launcher3/n0$a;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    iput-object v7, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 62
    .line 63
    move-object/from16 v8, p3

    .line 64
    .line 65
    iput-object v8, v7, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 66
    .line 67
    iput-boolean v3, v7, Lcom/android/launcher3/n0$a;->k:Z

    .line 68
    .line 69
    iget-object v7, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 70
    .line 71
    iget-object v7, v7, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 72
    .line 73
    const/4 v8, 0x1

    .line 74
    if-eqz v7, :cond_2

    .line 75
    .line 76
    const-wide/16 v9, 0x0

    .line 77
    .line 78
    invoke-interface {v7, v9, v10}, Lcom/android/launcher3/dragndrop/p$a;->a(D)Z

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    if-nez v7, :cond_2

    .line 83
    .line 84
    move v7, v8

    .line 85
    goto :goto_2

    .line 86
    :cond_2
    move v7, v3

    .line 87
    :goto_2
    iput-boolean v7, v0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 88
    .line 89
    iget-object v7, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 90
    .line 91
    new-instance v9, Lcom/android/launcher3/taskbar/u2;

    .line 92
    .line 93
    iget-object v10, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 94
    .line 95
    check-cast v10, Lcom/android/launcher3/taskbar/b;

    .line 96
    .line 97
    iget v12, v0, Lcom/android/launcher3/taskbar/j2;->A:I

    .line 98
    .line 99
    iget v13, v0, Lcom/android/launcher3/taskbar/j2;->B:I

    .line 100
    .line 101
    const v16, 0x3f99999a    # 1.2f

    .line 102
    .line 103
    .line 104
    move-object/from16 v11, p1

    .line 105
    .line 106
    move/from16 v14, p9

    .line 107
    .line 108
    move/from16 v15, p10

    .line 109
    .line 110
    invoke-direct/range {v9 .. v16}, Lcom/android/launcher3/taskbar/u2;-><init>(Lcom/android/launcher3/taskbar/b;Landroid/graphics/drawable/Drawable;IIFFF)V

    .line 111
    .line 112
    .line 113
    iput-object v9, v7, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 114
    .line 115
    if-eqz v1, :cond_3

    .line 116
    .line 117
    invoke-virtual {v9, v1}, Lcom/android/launcher3/dragndrop/v;->setItemInfo(Lcom/android/launcher3/model/data/y;)V

    .line 118
    .line 119
    .line 120
    :cond_3
    iget-object v7, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 121
    .line 122
    iput-boolean v3, v7, Lcom/android/launcher3/n0$a;->e:Z

    .line 123
    .line 124
    iget-object v10, v0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 125
    .line 126
    iget v11, v10, Landroid/graphics/Point;->x:I

    .line 127
    .line 128
    add-int v4, p4, v4

    .line 129
    .line 130
    sub-int/2addr v11, v4

    .line 131
    iput v11, v7, Lcom/android/launcher3/n0$a;->c:I

    .line 132
    .line 133
    iget v4, v10, Landroid/graphics/Point;->y:I

    .line 134
    .line 135
    add-int v5, p5, v5

    .line 136
    .line 137
    sub-int/2addr v4, v5

    .line 138
    iput v4, v7, Lcom/android/launcher3/n0$a;->d:I

    .line 139
    .line 140
    iget-object v4, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 141
    .line 142
    new-instance v5, Lcom/android/launcher3/taskbar/c2;

    .line 143
    .line 144
    invoke-direct {v5}, Lcom/android/launcher3/taskbar/c2;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-static {v0, v4, v5}, Lcom/android/launcher3/dragndrop/k;->a(Lcom/android/launcher3/dragndrop/j;Lcom/android/launcher3/dragndrop/p;Ljava/util/function/Consumer;)Lcom/android/launcher3/dragndrop/k;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    iput-object v4, v0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 152
    .line 153
    iget-object v4, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 154
    .line 155
    iget-boolean v4, v4, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 156
    .line 157
    if-nez v4, :cond_4

    .line 158
    .line 159
    iget-object v4, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 160
    .line 161
    invoke-static {v9}, LO0/e;->d(Landroid/view/View;)LO0/e;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    iput-object v5, v4, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 166
    .line 167
    :cond_4
    iget-object v4, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 168
    .line 169
    move-object/from16 v5, p6

    .line 170
    .line 171
    iput-object v5, v4, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 172
    .line 173
    iput-object v1, v4, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 174
    .line 175
    if-eqz v1, :cond_5

    .line 176
    .line 177
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->makeShallowCopy()Lcom/android/launcher3/model/data/y;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    :cond_5
    iput-object v6, v4, Lcom/android/launcher3/n0$a;->h:Lcom/android/launcher3/model/data/y;

    .line 182
    .line 183
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 184
    .line 185
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 186
    .line 187
    if-eqz v1, :cond_8

    .line 188
    .line 189
    invoke-interface {v1}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 194
    .line 195
    if-nez v1, :cond_7

    .line 196
    .line 197
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 198
    .line 199
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 200
    .line 201
    invoke-interface {v1}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 206
    .line 207
    if-eqz v1, :cond_6

    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_6
    move v8, v3

    .line 211
    :cond_7
    :goto_3
    invoke-virtual {v9, v8}, Lcom/android/launcher3/dragndrop/v;->setHasDragOffset(Z)V

    .line 212
    .line 213
    .line 214
    :cond_8
    if-eqz v2, :cond_9

    .line 215
    .line 216
    new-instance v1, Landroid/graphics/Rect;

    .line 217
    .line 218
    invoke-direct {v1, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v9, v1}, Lcom/android/launcher3/dragndrop/v;->setDragRegion(Landroid/graphics/Rect;)V

    .line 222
    .line 223
    .line 224
    :cond_9
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 225
    .line 226
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 227
    .line 228
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 229
    .line 230
    invoke-virtual {v9, v2, v1}, Lcom/android/launcher3/dragndrop/v;->F(II)V

    .line 231
    .line 232
    .line 233
    iput v3, v0, Lcom/android/launcher3/dragndrop/j;->t:I

    .line 234
    .line 235
    iget-boolean v1, v0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 236
    .line 237
    if-nez v1, :cond_a

    .line 238
    .line 239
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/j2;->k()V

    .line 240
    .line 241
    .line 242
    goto :goto_4

    .line 243
    :cond_a
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 244
    .line 245
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 246
    .line 247
    if-eqz v1, :cond_b

    .line 248
    .line 249
    iget-object v2, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 250
    .line 251
    invoke-interface {v1, v2}, Lcom/android/launcher3/dragndrop/p$a;->b(Lcom/android/launcher3/n0$a;)V

    .line 252
    .line 253
    .line 254
    :cond_b
    :goto_4
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 255
    .line 256
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 257
    .line 258
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 259
    .line 260
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/dragndrop/j;->F(II)V

    .line 261
    .line 262
    .line 263
    return-object v9
.end method

.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "TaskbarDragController:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\tmDragIconSize="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lcom/android/launcher3/taskbar/j2;->x:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "\tmTempXY="

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j2;->y:[I

    .line 60
    .line 61
    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\tmRegistrationX="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/android/launcher3/taskbar/j2;->A:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v1, "\tmRegistrationY="

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget v1, p0, Lcom/android/launcher3/taskbar/j2;->B:I

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, "\tmIsSystemDragInProgress="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/j2;->C:Z

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v1, "\tisInternalDragInProgess="

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-super {p0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v1, "\tmDisallowGlobalDrag="

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/j2;->F:Z

    .line 191
    .line 192
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string p1, "\tmDisallowLongClick="

    .line 211
    .line 212
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/j2;->G:Z

    .line 216
    .line 217
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public h(Lcom/android/launcher3/n0;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/dragndrop/j;->h(Lcom/android/launcher3/n0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected j()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/dragndrop/j;->j()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/j2;->t0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected k()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/dragndrop/j;->k()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j2;->F:Z

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    check-cast v1, Lcom/android/launcher3/taskbar/b;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/S1;->d(I)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 30
    .line 31
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 32
    .line 33
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/j2;->G0(Lcom/android/launcher3/BubbleTextView;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 38
    .line 39
    const/high16 v0, 0x40000

    .line 40
    .line 41
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public l0(Lcom/android/launcher3/taskbar/R1;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/g2;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/g2;-><init>(Lcom/android/launcher3/taskbar/j2;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public n0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/j2;->C:Z

    .line 2
    .line 3
    return p0
.end method

.method protected r()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j2;->F:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j2;->D:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, v0, Lcom/android/launcher3/n0$a;->k:Z

    .line 13
    .line 14
    iget v1, v0, Lcom/android/launcher3/n0$a;->a:I

    .line 15
    .line 16
    iget v2, v0, Lcom/android/launcher3/n0$a;->c:I

    .line 17
    .line 18
    sub-int/2addr v1, v2

    .line 19
    int-to-float v1, v1

    .line 20
    iget v2, v0, Lcom/android/launcher3/n0$a;->b:I

    .line 21
    .line 22
    iget v3, v0, Lcom/android/launcher3/n0$a;->d:I

    .line 23
    .line 24
    sub-int/2addr v2, v3

    .line 25
    int-to-float v2, v2

    .line 26
    iget-object v3, v0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 29
    .line 30
    check-cast v0, Landroid/view/View;

    .line 31
    .line 32
    new-instance v4, Lcom/android/launcher3/taskbar/Y1;

    .line 33
    .line 34
    invoke-direct {v4, v3}, Lcom/android/launcher3/taskbar/Y1;-><init>(Lcom/android/launcher3/dragndrop/v;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, v1, v2, v0, v4}, Lcom/android/launcher3/taskbar/j2;->B0(FFLandroid/view/View;Lcom/android/launcher3/taskbar/j2$f;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    new-instance v1, Lcom/android/launcher3/taskbar/j2$c;

    .line 43
    .line 44
    invoke-direct {v1, p0, v3}, Lcom/android/launcher3/taskbar/j2$c;-><init>(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/dragndrop/v;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2;->E:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 53
    .line 54
    .line 55
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/dragndrop/j;->r()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method protected t()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/j2;->F:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    check-cast v0, Lcom/android/launcher3/taskbar/b;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method protected w(FF)Landroid/graphics/Point;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->n:Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Point;->set(II)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->n:Landroid/graphics/Point;

    .line 15
    .line 16
    return-object p0
.end method

.method public w0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2;->z:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v1, Lcom/android/launcher3/taskbar/d2;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/d2;-><init>(Lcom/android/launcher3/taskbar/j2;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected x([I)Lcom/android/launcher3/n0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public x0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/j2;->k()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public z0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/j2;->F:Z

    .line 2
    .line 3
    return-void
.end method
