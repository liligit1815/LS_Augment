.class public Lcom/android/launcher3/anim/G;
.super Landroid/view/View;
.source "BoomField.java"


# instance fields
.field private g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/anim/F;",
            ">;"
        }
    .end annotation
.end field

.field private h:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/view/View;",
            "Lcom/android/launcher3/anim/F;",
            ">;"
        }
    .end annotation
.end field

.field private i:LS0/a;

.field private j:Lcom/android/launcher3/anim/F;

.field private k:Lcom/android/launcher3/P2;


# direct methods
.method public constructor <init>(Landroid/content/Context;LS0/a;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/anim/G;->j:Lcom/android/launcher3/anim/F;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Lcom/android/launcher3/anim/G;->i(LS0/a;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/android/launcher3/anim/G;->k:Lcom/android/launcher3/P2;

    .line 15
    .line 16
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/anim/G;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/G;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/anim/G;)Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/G;->h:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/anim/G;Lcom/android/launcher3/anim/F;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/G;->j:Lcom/android/launcher3/anim/F;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/anim/G;Landroid/view/View;Landroid/graphics/Rect;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/anim/G;->g(Landroid/view/View;Landroid/graphics/Rect;Landroid/animation/AnimatorListenerAdapter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g(Landroid/view/View;Landroid/graphics/Rect;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/F;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/anim/H;->a(Landroid/view/View;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/android/launcher3/anim/G;->i:LS0/a;

    .line 8
    .line 9
    invoke-direct {v0, p0, v1, p2, v2}, Lcom/android/launcher3/anim/F;-><init>(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/Rect;LS0/a;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/anim/G;->j:Lcom/android/launcher3/anim/F;

    .line 13
    .line 14
    iget-object p2, p0, Lcom/android/launcher3/anim/G;->g:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/android/launcher3/anim/G;->h:Ljava/util/HashMap;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/anim/G;->j:Lcom/android/launcher3/anim/F;

    .line 22
    .line 23
    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/android/launcher3/anim/G;->j:Lcom/android/launcher3/anim/F;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/anim/G$c;

    .line 29
    .line 30
    invoke-direct {v0, p0, p3, p1}, Lcom/android/launcher3/anim/G$c;-><init>(Lcom/android/launcher3/anim/G;Landroid/animation/AnimatorListenerAdapter;Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/anim/G;->j:Lcom/android/launcher3/anim/F;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/anim/F;->start()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private i(LS0/a;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/anim/G;->g:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/anim/G;->h:Ljava/util/HashMap;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/android/launcher3/anim/G;->i:LS0/a;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public e()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/G;->k:Lcom/android/launcher3/P2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/anim/G;->k:Lcom/android/launcher3/P2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    array-length v1, v0

    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    if-ge v2, v1, :cond_2

    .line 22
    .line 23
    aget-object v3, v0, v2

    .line 24
    .line 25
    instance-of v4, v3, Lcom/android/launcher3/C2;

    .line 26
    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    move-object v4, v3

    .line 30
    check-cast v4, Lcom/android/launcher3/C2;

    .line 31
    .line 32
    const v5, 0x7f0b0339

    .line 33
    .line 34
    .line 35
    invoke-virtual {v4, v5}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Landroid/view/ViewGroup;

    .line 40
    .line 41
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    const/4 v6, -0x1

    .line 44
    invoke-direct {v5, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    if-nez v6, :cond_0

    .line 52
    .line 53
    invoke-virtual {v4, p0, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v5, "attach2Activity-"

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v5, "-cb-"

    .line 75
    .line 76
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v3, "-parent-"

    .line 83
    .line 84
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    const-string v4, "ExplosionField"

    .line 99
    .line 100
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    :goto_1
    new-instance v3, Lcom/android/launcher3/anim/G$d;

    .line 104
    .line 105
    invoke-direct {v3, p0}, Lcom/android/launcher3/anim/G$d;-><init>(Lcom/android/launcher3/anim/G;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    new-instance v3, Lcom/android/launcher3/anim/G$e;

    .line 112
    .line 113
    invoke-direct {v3, p0}, Lcom/android/launcher3/anim/G$e;-><init>(Lcom/android/launcher3/anim/G;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 117
    .line 118
    .line 119
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_2
    return-void
.end method

.method public f(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/anim/G;->e()V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    new-instance v2, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Landroid/app/Activity;

    .line 38
    .line 39
    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 48
    .line 49
    .line 50
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 51
    .line 52
    neg-int v1, v1

    .line 53
    sub-int/2addr v1, v2

    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const/4 v1, 0x2

    .line 72
    new-array v1, v1, [F

    .line 73
    .line 74
    fill-array-data v1, :array_0

    .line 75
    .line 76
    .line 77
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-wide/16 v2, 0x96

    .line 82
    .line 83
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    new-instance v2, Lcom/android/launcher3/anim/G$a;

    .line 88
    .line 89
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/anim/G$a;-><init>(Lcom/android/launcher3/anim/G;Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 93
    .line 94
    .line 95
    new-instance v2, Lcom/android/launcher3/anim/G$b;

    .line 96
    .line 97
    invoke-direct {v2, p0, p1, v0, p2}, Lcom/android/launcher3/anim/G$b;-><init>(Lcom/android/launcher3/anim/G;Landroid/view/View;Landroid/graphics/Rect;Landroid/animation/AnimatorListenerAdapter;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/anim/G;->h()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public h()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/G;->k:Lcom/android/launcher3/P2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/anim/G;->k:Lcom/android/launcher3/P2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    array-length v1, v0

    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    if-ge v2, v1, :cond_1

    .line 22
    .line 23
    aget-object v3, v0, v2

    .line 24
    .line 25
    instance-of v4, v3, Lcom/android/launcher3/C2;

    .line 26
    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    check-cast v3, Lcom/android/launcher3/C2;

    .line 30
    .line 31
    const v4, 0x7f0b0339

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v4}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Landroid/view/ViewGroup;

    .line 39
    .line 40
    invoke-virtual {v3, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/anim/G;->g:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/anim/F;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/android/launcher3/anim/F;->a(Landroid/graphics/Canvas;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method
