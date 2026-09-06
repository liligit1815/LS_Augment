.class public Lcom/android/launcher3/apppairs/AppPairIconGraphic;
.super Landroid/widget/FrameLayout;
.source "AppPairIconGraphic.kt"

# interfaces
.implements Lcom/android/launcher3/X3$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;
    }
.end annotation


# static fields
.field public static final k:Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;


# instance fields
.field private final g:Ljava/lang/String;

.field private h:Lcom/android/launcher3/apppairs/AppPairIcon;

.field private i:LW0/b;

.field public j:Lcom/android/launcher3/apppairs/a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->k:Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    const-string p1, "AppPairIconGraphic"

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->g:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static final a(Lcom/android/launcher3/model/data/l;LW0/b;)Lcom/android/launcher3/apppairs/a;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->k:Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;->a(Lcom/android/launcher3/model/data/l;LW0/b;)Lcom/android/launcher3/apppairs/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private final getActivityContext()Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    const-string v0, "outBounds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 7
    .line 8
    const-string v1, "drawParams"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    move-object v0, v2

    .line 17
    :cond_0
    invoke-virtual {v0}, LW0/b;->a()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    float-to-int v0, v0

    .line 22
    iget-object v3, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 23
    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    move-object v3, v2

    .line 30
    :cond_1
    invoke-virtual {v3}, LW0/b;->a()F

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    float-to-int v3, v3

    .line 35
    const/4 v4, 0x0

    .line 36
    invoke-virtual {p1, v4, v4, v0, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->h:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 40
    .line 41
    const-string v3, "parentIcon"

    .line 42
    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    move-object v0, v2

    .line 49
    :cond_2
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    int-to-float v0, v0

    .line 54
    iget-object v4, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 55
    .line 56
    if-nez v4, :cond_3

    .line 57
    .line 58
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    move-object v4, v2

    .line 62
    :cond_3
    invoke-virtual {v4}, LW0/b;->a()F

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    sub-float/2addr v0, v4

    .line 67
    const/4 v4, 0x2

    .line 68
    int-to-float v4, v4

    .line 69
    div-float/2addr v0, v4

    .line 70
    float-to-int v0, v0

    .line 71
    iget-object v4, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->h:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 72
    .line 73
    if-nez v4, :cond_4

    .line 74
    .line 75
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    move-object v4, v2

    .line 79
    :cond_4
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    int-to-float v3, v3

    .line 84
    iget-object v4, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 85
    .line 86
    if-nez v4, :cond_5

    .line 87
    .line 88
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    move-object v4, v2

    .line 92
    :cond_5
    invoke-virtual {v4}, LW0/b;->l()F

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    add-float/2addr v3, v4

    .line 97
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 98
    .line 99
    if-nez p0, :cond_6

    .line 100
    .line 101
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_6
    move-object v2, p0

    .line 106
    :goto_0
    invoke-virtual {v2}, LW0/b;->j()F

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    add-float/2addr v3, p0

    .line 111
    float-to-int p0, v3

    .line 112
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Rect;->offset(II)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final c(Lcom/android/launcher3/apppairs/AppPairIcon;I)V
    .locals 3

    .line 1
    const-string v0, "icon"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->h:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 7
    .line 8
    new-instance v0, LW0/b;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "getContext(...)"

    .line 15
    .line 16
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {v0, v1, p2}, LW0/b;-><init>(Landroid/content/Context;I)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 23
    .line 24
    sget-object p2, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->k:Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "getInfo(...)"

    .line 31
    .line 32
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    const-string v2, "drawParams"

    .line 39
    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    move-object v0, v1

    .line 46
    :cond_0
    invoke-virtual {p2, p1, v0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;->a(Lcom/android/launcher3/model/data/l;LW0/b;)Lcom/android/launcher3/apppairs/a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->setDrawable(Lcom/android/launcher3/apppairs/a;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string p2, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 58
    .line 59
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 63
    .line 64
    const/4 p2, 0x1

    .line 65
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 66
    .line 67
    iget-object p2, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 68
    .line 69
    if-nez p2, :cond_1

    .line 70
    .line 71
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    move-object p2, v1

    .line 75
    :cond_1
    invoke-virtual {p2}, LW0/b;->g()I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 80
    .line 81
    iget-object p2, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 82
    .line 83
    if-nez p2, :cond_2

    .line 84
    .line 85
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    move-object v1, p2

    .line 90
    :goto_0
    invoke-virtual {v1}, LW0/b;->g()I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final d(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "drawParams"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->h:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 20
    .line 21
    if-nez p1, :cond_2

    .line 22
    .line 23
    const-string p1, "parentIcon"

    .line 24
    .line 25
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    move-object v1, p1

    .line 30
    :goto_0
    invoke-virtual {v1}, Lcom/android/launcher3/apppairs/AppPairIcon;->getContainer()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    :goto_1
    invoke-virtual {v0, p1}, LW0/b;->o(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->e()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->getDrawable()Lcom/android/launcher3/apppairs/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/apppairs/a;->draw(Landroid/graphics/Canvas;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final e()V
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->k:Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->h:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const-string v1, "parentIcon"

    .line 9
    .line 10
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    move-object v1, v2

    .line 14
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/apppairs/AppPairIcon;->getInfo()Lcom/android/launcher3/model/data/l;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v3, "getInfo(...)"

    .line 19
    .line 20
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v3, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 24
    .line 25
    if-nez v3, :cond_1

    .line 26
    .line 27
    const-string v3, "drawParams"

    .line 28
    .line 29
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move-object v2, v3

    .line 34
    :goto_0
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/apppairs/AppPairIconGraphic$a;->a(Lcom/android/launcher3/model/data/l;LW0/b;)Lcom/android/launcher3/apppairs/a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->setDrawable(Lcom/android/launcher3/apppairs/a;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final getDrawable()Lcom/android/launcher3/apppairs/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->j:Lcom/android/launcher3/apppairs/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "drawable"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getHoverScale()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "drawParams"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, LW0/b;->f()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->getActivityContext()Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->getActivityContext()Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    const-string v0, "dp"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string v0, "drawParams"

    .line 11
    .line 12
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :cond_0
    invoke-virtual {v0, p1}, LW0/b;->p(Lcom/android/launcher3/h0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->e()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final setDrawable(Lcom/android/launcher3/apppairs/a;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->j:Lcom/android/launcher3/apppairs/a;

    .line 7
    .line 8
    return-void
.end method

.method public final setHoverScale(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->i:LW0/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "drawParams"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {v0, p1}, LW0/b;->n(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->e()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
