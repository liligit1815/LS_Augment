.class public abstract Lcom/android/launcher3/widget/o;
.super Lcom/android/launcher3/views/f;
.source "BaseWidgetSheet.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Ln2/c$a;
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/X3$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/views/f<",
        "Lcom/android/launcher3/v;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/view/View$OnLongClickListener;",
        "Ln2/c$a;",
        "Lcom/android/launcher3/g1;",
        "Lcom/android/launcher3/X3$b;"
    }
.end annotation


# static fields
.field private static final a0:Ljava/lang/String; = "o"


# instance fields
.field protected final E:Landroid/graphics/Rect;

.field protected F:I

.field protected G:I

.field protected H:I

.field private final I:Landroid/graphics/Paint;

.field private J:Z

.field private K:Lcom/android/launcher3/widget/WidgetCell;

.field private L:Lz1/Z4;

.field protected M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

.field protected N:Landroid/widget/LinearLayout;

.field private O:Lcom/zte/mifavor/widget/RealtimeEffectView;

.field protected final P:[F

.field protected Q:Z

.field private R:Landroid/content/res/Configuration;

.field protected final S:Landroid/graphics/PointF;

.field protected final T:Landroid/graphics/PointF;

.field protected U:Landroid/view/View;

.field protected V:Z

.field private W:Landroid/view/ViewOutlineProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/views/f;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/launcher3/widget/o;->E:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    iput-boolean p2, p0, Lcom/android/launcher3/widget/o;->J:Z

    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    iput-object p3, p0, Lcom/android/launcher3/widget/o;->K:Lcom/android/launcher3/widget/WidgetCell;

    .line 16
    .line 17
    iput-object p3, p0, Lcom/android/launcher3/widget/o;->L:Lz1/Z4;

    .line 18
    .line 19
    const/4 p3, 0x2

    .line 20
    new-array p3, p3, [F

    .line 21
    .line 22
    iput-object p3, p0, Lcom/android/launcher3/widget/o;->P:[F

    .line 23
    .line 24
    iput-boolean p2, p0, Lcom/android/launcher3/widget/o;->Q:Z

    .line 25
    .line 26
    new-instance p2, Landroid/graphics/PointF;

    .line 27
    .line 28
    invoke-direct {p2}, Landroid/graphics/PointF;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/launcher3/widget/o;->S:Landroid/graphics/PointF;

    .line 32
    .line 33
    new-instance p2, Landroid/graphics/PointF;

    .line 34
    .line 35
    invoke-direct {p2}, Landroid/graphics/PointF;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p2, p0, Lcom/android/launcher3/widget/o;->T:Landroid/graphics/PointF;

    .line 39
    .line 40
    new-instance p2, Lcom/android/launcher3/widget/o$a;

    .line 41
    .line 42
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/o$a;-><init>(Lcom/android/launcher3/widget/o;)V

    .line 43
    .line 44
    .line 45
    iput-object p2, p0, Lcom/android/launcher3/widget/o;->W:Landroid/view/ViewOutlineProvider;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getWidgetListHorizontalMargin()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    iput p2, p0, Lcom/android/launcher3/widget/o;->F:I

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const p3, 0x7f070c5b

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    iput p2, p0, Lcom/android/launcher3/widget/o;->G:I

    .line 65
    .line 66
    new-instance p2, Landroid/graphics/Paint;

    .line 67
    .line 68
    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object p2, p0, Lcom/android/launcher3/widget/o;->I:Landroid/graphics/Paint;

    .line 72
    .line 73
    iget-object p3, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 74
    .line 75
    check-cast p3, Lcom/android/launcher3/v;

    .line 76
    .line 77
    invoke-static {p3}, Lcom/android/launcher3/util/F2;->l(Landroid/content/Context;)I

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    .line 83
    .line 84
    const p3, 0x7f040060

    .line 85
    .line 86
    .line 87
    const v0, 0x7f1501a5

    .line 88
    .line 89
    .line 90
    invoke-static {p1, p3, v0}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 95
    .line 96
    .line 97
    new-instance p1, Landroid/content/res/Configuration;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-direct {p1, p2}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 108
    .line 109
    .line 110
    iput-object p1, p0, Lcom/android/launcher3/widget/o;->R:Landroid/content/res/Configuration;

    .line 111
    .line 112
    invoke-direct {p0}, Lcom/android/launcher3/widget/o;->H0()V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private A0(Landroid/graphics/RectF;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->N:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v0, v1

    .line 11
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->N:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    int-to-float v2, v2

    .line 18
    div-float/2addr v2, v1

    .line 19
    iget-object v1, p0, Lcom/android/launcher3/widget/o;->P:[F

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    aput v0, v1, v3

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    aput v2, v1, v4

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/widget/o;->N:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    iget-object v5, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 30
    .line 31
    check-cast v5, Lcom/android/launcher3/v;

    .line 32
    .line 33
    invoke-interface {v5}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    iget-object v6, p0, Lcom/android/launcher3/widget/o;->P:[F

    .line 38
    .line 39
    invoke-static {v1, v5, v6, v3}, Lcom/android/launcher3/N5;->m(Landroid/view/View;Landroid/view/View;[FZ)F

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->P:[F

    .line 43
    .line 44
    aget v1, p0, v3

    .line 45
    .line 46
    sub-float v3, v1, v0

    .line 47
    .line 48
    float-to-int v3, v3

    .line 49
    int-to-float v3, v3

    .line 50
    aget p0, p0, v4

    .line 51
    .line 52
    sub-float v4, p0, v2

    .line 53
    .line 54
    float-to-int v4, v4

    .line 55
    int-to-float v4, v4

    .line 56
    add-float/2addr v1, v0

    .line 57
    float-to-int v0, v1

    .line 58
    int-to-float v0, v0

    .line 59
    add-float/2addr p0, v2

    .line 60
    float-to-int p0, p0

    .line 61
    int-to-float p0, p0

    .line 62
    invoke-virtual {p1, v3, v4, v0, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private F0(Landroid/view/WindowInsets;)I
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/o;->J:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getTappableElementInsets()Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Landroid/graphics/Insets;->bottom:I

    .line 12
    .line 13
    return p0
.end method

.method private H0()V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    instance-of v0, p0, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    instance-of v0, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/high16 v0, 0x3f000000    # 0.5f

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/android/launcher3/touch/H;->x(F)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method private synthetic I0(Lcom/android/launcher3/W4;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->r3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic J0(Lcom/android/launcher3/C2;Lcom/android/launcher3/W4;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->D1()LO0/r;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/android/launcher3/widget/n;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/widget/n;-><init>(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/W4;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {p1, p2, p0, v0}, LO0/r;->u(Lcom/android/launcher3/model/data/y;ZLjava/util/function/Consumer;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic K0(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/android/launcher3/W4;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 23
    .line 24
    new-instance v2, Lcom/android/launcher3/widget/m;

    .line 25
    .line 26
    invoke-direct {v2, p0, p1, p2}, Lcom/android/launcher3/widget/m;-><init>(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/C2;Lcom/android/launcher3/W4;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/statemanager/d;->K(Lcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic L0(Lcom/android/launcher3/W4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/o;->v0(Lcom/android/launcher3/W4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic M0(Lcom/android/launcher3/widget/WidgetCell;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private R0(Lcom/android/launcher3/widget/WidgetCell;)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->E0(Lcom/android/launcher3/widget/WidgetCell;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    const v4, 0x7f070c52

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    iget v4, v1, Landroid/graphics/Rect;->top:I

    .line 28
    .line 29
    add-int/2addr v4, v0

    .line 30
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 35
    .line 36
    sub-int/2addr v0, v1

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    add-int/2addr v0, v3

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    if-eqz v4, :cond_1

    .line 42
    .line 43
    neg-int v0, v4

    .line 44
    sub-int/2addr v0, v3

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 v0, 0x0

    .line 47
    :goto_0
    if-eqz v2, :cond_2

    .line 48
    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    if-nez v2, :cond_3

    .line 53
    .line 54
    const-string p0, "BaseWidgetSheet"

    .line 55
    .line 56
    const-string p1, "click on invisible WidgetCell should not be possible"

    .line 57
    .line 58
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/widget/o;->Q0(Lcom/android/launcher3/widget/WidgetCell;I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static synthetic o0(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/C2;Lcom/android/launcher3/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/o;->J0(Lcom/android/launcher3/C2;Lcom/android/launcher3/W4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p0(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/W4;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/o;->I0(Lcom/android/launcher3/W4;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q0(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/widget/WidgetCell;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/o;->M0(Lcom/android/launcher3/widget/WidgetCell;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r0(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/W4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/o;->L0(Lcom/android/launcher3/W4;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s0(Lcom/android/launcher3/widget/o;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/android/launcher3/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/o;->K0(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/android/launcher3/W4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic t0(Lcom/android/launcher3/widget/o;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic u0(Lcom/android/launcher3/widget/o;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method private v0(Lcom/android/launcher3/W4;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/widget/l;

    .line 8
    .line 9
    invoke-direct {v1, p0, v0, p1}, Lcom/android/launcher3/widget/l;-><init>(Lcom/android/launcher3/widget/o;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/android/launcher3/W4;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/android/launcher3/views/f;->R(Lcom/android/launcher3/views/f$e;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public B0(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/o;->A0(Landroid/graphics/RectF;)V

    .line 7
    .line 8
    .line 9
    instance-of v1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    instance-of v1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/widget/o;->V:Z

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    sget-object p0, Lcom/android/launcher3/widget/o;->a0:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v1, "delegateTouchDragEvent: ev = "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p1, ", return false ! "

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    return v2

    .line 54
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_2

    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    if-eq p1, v1, :cond_2

    .line 62
    .line 63
    const/4 v1, 0x2

    .line 64
    if-eq p1, v1, :cond_2

    .line 65
    .line 66
    return v2

    .line 67
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->S:Landroid/graphics/PointF;

    .line 68
    .line 69
    iget p1, p0, Landroid/graphics/PointF;->x:F

    .line 70
    .line 71
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 72
    .line 73
    invoke-virtual {v0, p1, p0}, Landroid/graphics/RectF;->contains(FF)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0
.end method

.method public C0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/o;->J:Z

    .line 2
    .line 3
    return-void
.end method

.method protected D0(II)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getInsetsWidth()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/v;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 14
    .line 15
    iget v5, v0, Lcom/android/launcher3/h0;->x2:I

    .line 16
    .line 17
    move-object v0, p0

    .line 18
    move v2, p1

    .line 19
    move v4, p2

    .line 20
    invoke-virtual/range {v0 .. v5}, Landroid/widget/LinearLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 21
    .line 22
    .line 23
    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {v4}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {v0, p0, p1}, Landroid/widget/LinearLayout;->setMeasuredDimension(II)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method protected E0(Lcom/android/launcher3/widget/WidgetCell;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected G0(Lcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    iget p0, p1, Lcom/android/launcher3/h0;->L2:I

    .line 2
    .line 3
    return p0
.end method

.method protected abstract N0(I)V
.end method

.method protected O0(Landroid/view/View;Lcom/android/launcher3/widget/o;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->cancelLongPress()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/touch/A;->d(Lcom/android/launcher3/C2;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 22
    .line 23
    check-cast v0, Lcom/android/launcher3/v;

    .line 24
    .line 25
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0, p1}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    iput-boolean v1, p0, Lcom/android/launcher3/widget/o;->V:Z

    .line 36
    .line 37
    instance-of v0, p2, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 38
    .line 39
    const-wide/16 v2, 0xfa

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p2, v2, v3}, Lcom/android/launcher3/widget/o;->w0(J)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    instance-of v0, p2, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    move-object v0, p2

    .line 52
    check-cast v0, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/widget/CustomTransformSheet;->getUpperPage()Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/widget/o;->w0(J)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2, v2, v3}, Lcom/android/launcher3/widget/o;->w0(J)V

    .line 62
    .line 63
    .line 64
    :cond_2
    :goto_0
    invoke-virtual {p0, v2, v3}, Lcom/android/launcher3/widget/o;->w0(J)V

    .line 65
    .line 66
    .line 67
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 68
    .line 69
    :cond_3
    return p1

    .line 70
    :cond_4
    return v1
.end method

.method public P0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/o;->a0:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "resetTouchEvent: mIsResetTouchEvent  = false"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/widget/o;->V:Z

    .line 10
    .line 11
    return-void
.end method

.method protected abstract Q0(Lcom/android/launcher3/widget/WidgetCell;I)V
.end method

.method protected S0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/widget/o;->W:Landroid/view/ViewOutlineProvider;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipToOutline(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method protected T0()V
    .locals 0

    .line 1
    return-void
.end method

.method public U0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->N:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    check-cast v0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->i1()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->N:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const v2, 0x7f07021e

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 38
    .line 39
    iget-object v1, p0, Lcom/android/launcher3/widget/o;->N:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->U:Landroid/view/View;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const v2, 0x7f07014c

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 66
    .line 67
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 68
    .line 69
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->U:Landroid/view/View;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
.end method

.method protected V0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 13
    .line 14
    check-cast v1, Lcom/android/launcher3/v;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 21
    .line 22
    int-to-float v1, v1

    .line 23
    const/high16 v2, 0x3e800000    # 0.25f

    .line 24
    .line 25
    mul-float/2addr v1, v2

    .line 26
    float-to-int v1, v1

    .line 27
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 30
    .line 31
    check-cast v1, Lcom/android/launcher3/v;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 38
    .line 39
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 40
    .line 41
    sub-int/2addr v1, v2

    .line 42
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const v2, 0x7f060068

    .line 56
    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->W0()V

    .line 67
    .line 68
    .line 69
    const v0, 0x7f0b04bb

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/android/launcher3/widget/o;->O:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 79
    .line 80
    if-eqz v0, :cond_0

    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->O:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 83
    .line 84
    const/high16 v1, 0x43820000    # 260.0f

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/RealtimeEffectView;->setBlurRadius(F)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->O:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 90
    .line 91
    invoke-virtual {v0, p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->setDecorView(Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    :cond_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_1

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->U0()V

    .line 105
    .line 106
    .line 107
    :cond_1
    return-void
.end method

.method public W0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    const/high16 v2, 0x3f800000    # 1.0f

    .line 21
    .line 22
    iget v3, p0, Lcom/android/launcher3/views/f;->o:F

    .line 23
    .line 24
    sub-float/2addr v2, v3

    .line 25
    mul-float/2addr v1, v2

    .line 26
    float-to-int v1, v1

    .line 27
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 31
    .line 32
    instance-of v2, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    move-object v2, p0

    .line 37
    check-cast v2, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/android/launcher3/widget/ComponentsFullSheet;->i1()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_0

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move v2, v1

    .line 48
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    const v2, 0x7f070208

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    const v2, 0x7f070207

    .line 63
    .line 64
    .line 65
    :goto_1
    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    iget-object v3, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 70
    .line 71
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    iget-object v5, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 76
    .line 77
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    iget-object v6, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 82
    .line 83
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Lx1/O;->c0()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-nez v3, :cond_2

    .line 95
    .line 96
    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 97
    .line 98
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 99
    .line 100
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    iget-object v4, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 105
    .line 106
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    iget-object v5, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 111
    .line 112
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    invoke-virtual {v2, v3, v1, v4, v5}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 117
    .line 118
    .line 119
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    .line 123
    .line 124
    :cond_3
    return-void
.end method

.method protected X(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const p1, 0x7f06085e

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method protected d0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/f;->d0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->z0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget v0, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 10
    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v0, v0

    .line 18
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScaleX()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    div-float/2addr v1, v2

    .line 28
    sub-float/2addr v0, v1

    .line 29
    const/high16 v1, 0x40000000    # 2.0f

    .line 30
    .line 31
    div-float v3, v0, v1

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    int-to-float v0, v0

    .line 38
    div-float/2addr v0, v1

    .line 39
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    int-to-float v2, v2

    .line 44
    div-float/2addr v2, v1

    .line 45
    iget v1, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 46
    .line 47
    int-to-float v1, v1

    .line 48
    sub-float/2addr v2, v1

    .line 49
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScaleY()F

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    div-float/2addr v2, v1

    .line 54
    add-float v4, v0, v2

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    int-to-float v0, v0

    .line 61
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScaleX()F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    div-float v5, v0, v1

    .line 66
    .line 67
    iget v0, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 68
    .line 69
    int-to-float v0, v0

    .line 70
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getScaleY()F

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    div-float/2addr v0, v1

    .line 75
    add-float v6, v4, v0

    .line 76
    .line 77
    iget-object v7, p0, Lcom/android/launcher3/widget/o;->I:Landroid/graphics/Paint;

    .line 78
    .line 79
    move-object v2, p1

    .line 80
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method protected getIdleInterpolator()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/views/f;->getIdleInterpolator()Landroid/view/animation/Interpolator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method protected getInsetsWidth()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/o;->G0(Lcom/android/launcher3/h0;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    mul-int/lit8 v0, v0, 0x2

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->E:Landroid/graphics/Rect;

    .line 20
    .line 21
    iget v1, p0, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 24
    .line 25
    add-int/2addr v1, p0

    .line 26
    mul-int/lit8 v1, v1, 0x2

    .line 27
    .line 28
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->E:Landroid/graphics/Rect;

    .line 34
    .line 35
    iget v1, p0, Landroid/graphics/Rect;->bottom:I

    .line 36
    .line 37
    if-lez v1, :cond_1

    .line 38
    .line 39
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 40
    .line 41
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 42
    .line 43
    add-int/2addr v0, p0

    .line 44
    return v0

    .line 45
    :cond_1
    iget-object v0, v0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 46
    .line 47
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    add-int/2addr v1, v0

    .line 52
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    iget p0, p0, Landroid/graphics/Rect;->right:I

    .line 55
    .line 56
    add-int/2addr v0, p0

    .line 57
    mul-int/lit8 v0, v0, 0x2

    .line 58
    .line 59
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0
.end method

.method public getIsSheetStateFull()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    sub-float/2addr p0, v0

    .line 5
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const v0, 0x3a83126f    # 0.001f

    .line 10
    .line 11
    .line 12
    cmpg-float p0, p0, v0

    .line 13
    .line 14
    if-gez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public getIsSheetStateHalf()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 2
    .line 3
    const v0, 0x3f19999a    # 0.6f

    .line 4
    .line 5
    .line 6
    sub-float/2addr p0, v0

    .line 7
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const v0, 0x3a83126f    # 0.001f

    .line 12
    .line 13
    .line 14
    cmpg-float p0, p0, v0

    .line 15
    .line 16
    if-gez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method protected getLastSelectedWidgetItem()Lz1/Z4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->L:Lz1/Z4;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getShiftRange()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    return p0
.end method

.method protected getSystemUiController()Lcom/android/launcher3/util/E2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUpperPage()Lcom/android/launcher3/widget/o;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method protected getWidgetListHorizontalMargin()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070c76

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/o;->F0(Landroid/view/WindowInsets;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method protected onAttachedToWindow()V
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/o;->a0:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onAttachedToWindow"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/util/window/d;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/util/window/d;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    new-instance v3, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher3/util/window/d;->normalizeWindowInsets(Landroid/content/Context;Landroid/view/WindowInsets;Landroid/graphics/Rect;)Landroid/view/WindowInsets;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/o;->F0(Landroid/view/WindowInsets;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 47
    .line 48
    check-cast v0, Lcom/android/launcher3/v;

    .line 49
    .line 50
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, p0}, Ln2/c;->l(Ln2/c$a;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 58
    .line 59
    check-cast v0, Lcom/android/launcher3/v;

    .line 60
    .line 61
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 13
    .line 14
    if-eqz v0, :cond_7

    .line 15
    .line 16
    check-cast p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 17
    .line 18
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/o;->R0(Lcom/android/launcher3/widget/WidgetCell;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->K:Lcom/android/launcher3/widget/WidgetCell;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetCell;->p()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->K:Lcom/android/launcher3/widget/WidgetCell;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/WidgetCell;->n(Z)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iput-object v1, p0, Lcom/android/launcher3/widget/o;->K:Lcom/android/launcher3/widget/WidgetCell;

    .line 40
    .line 41
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->K:Lcom/android/launcher3/widget/WidgetCell;

    .line 42
    .line 43
    if-eq v0, p1, :cond_4

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/android/launcher3/W4;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 52
    .line 53
    instance-of v2, v2, Lcom/android/launcher3/C2;

    .line 54
    .line 55
    if-eqz v2, :cond_3

    .line 56
    .line 57
    new-instance v2, Lcom/android/launcher3/widget/j;

    .line 58
    .line 59
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/widget/j;-><init>(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/W4;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v2}, Lcom/android/launcher3/widget/WidgetCell;->w(Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    new-instance v0, Lcom/android/launcher3/widget/k;

    .line 67
    .line 68
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/widget/k;-><init>(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/widget/WidgetCell;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lcom/android/launcher3/widget/WidgetCell;->w(Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->K:Lcom/android/launcher3/widget/WidgetCell;

    .line 75
    .line 76
    if-eq v0, p1, :cond_5

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_5
    move-object p1, v1

    .line 80
    :goto_3
    iput-object p1, p0, Lcom/android/launcher3/widget/o;->K:Lcom/android/launcher3/widget/WidgetCell;

    .line 81
    .line 82
    if-eqz p1, :cond_6

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetItem()Lz1/Z4;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/android/launcher3/widget/o;->L:Lz1/Z4;

    .line 89
    .line 90
    return-void

    .line 91
    :cond_6
    iput-object v1, p0, Lcom/android/launcher3/widget/o;->L:Lz1/Z4;

    .line 92
    .line 93
    :cond_7
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    instance-of v0, p0, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->R:Landroid/content/res/Configuration;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/content/res/Configuration;->diff(Landroid/content/res/Configuration;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    and-int/lit16 v0, v0, 0x480

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->V0()V

    .line 29
    .line 30
    .line 31
    invoke-interface {p0}, Ln2/c$a;->w()V

    .line 32
    .line 33
    .line 34
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->R:Landroid/content/res/Configuration;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/content/res/Configuration;->setTo(Landroid/content/res/Configuration;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/o;->a0:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onDetachedFromWindow"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->O:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->O:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/android/launcher3/widget/o;->O:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/RealtimeEffectView;->getPreDrawListener()Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->O:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->u()V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 42
    .line 43
    check-cast v0, Lcom/android/launcher3/v;

    .line 44
    .line 45
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 52
    .line 53
    check-cast v0, Lcom/android/launcher3/v;

    .line 54
    .line 55
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Ln2/c;->l(Ln2/c$a;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 64
    .line 65
    check-cast v0, Lcom/android/launcher3/v;

    .line 66
    .line 67
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->l(Landroid/content/Context;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->I:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eq v0, p1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->I:Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->T0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onDrag(F)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    iget-boolean v1, p0, Lcom/android/launcher3/widget/o;->Q:Z

    .line 9
    .line 10
    const v2, 0x3f19999a    # 0.6f

    .line 11
    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    instance-of v1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    instance-of v1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    instance-of v1, p0, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    instance-of v1, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    :cond_0
    div-float v0, p1, v0

    .line 33
    .line 34
    add-float/2addr v0, v2

    .line 35
    const/high16 v1, 0x3f800000    # 1.0f

    .line 36
    .line 37
    invoke-static {v0, v3, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-static {p1, v3, v0}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    div-float v0, v1, v0

    .line 47
    .line 48
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 49
    .line 50
    .line 51
    cmpl-float p1, p1, v3

    .line 52
    .line 53
    if-lez p1, :cond_3

    .line 54
    .line 55
    instance-of p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 56
    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    instance-of p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 60
    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    instance-of p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 64
    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    :cond_2
    cmpl-float p1, v0, v2

    .line 68
    .line 69
    if-lez p1, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getUpperPage()Lcom/android/launcher3/widget/o;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    if-eqz p0, :cond_3

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getUpperPage()Lcom/android/launcher3/widget/o;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    if-eqz p0, :cond_3

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 99
    .line 100
    .line 101
    :cond_3
    const/4 p0, 0x1

    .line 102
    return p0
.end method

.method public onDragEnd(F)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    const v3, 0x3f19999a    # 0.6f

    .line 10
    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    cmpl-float v0, p1, v2

    .line 15
    .line 16
    if-lez v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 19
    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/android/launcher3/widget/o;->Q:Z

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget v0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 30
    .line 31
    sub-float v0, v3, v0

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-static {p1, v0}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    invoke-virtual {p0, v3, v0, v1}, Lcom/android/launcher3/views/f;->m0(FJ)Lcom/android/launcher3/anim/q;

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->h()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    sget-object v0, Lcom/android/launcher3/anim/L;->b:Landroid/view/animation/Interpolator;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-static {p1}, LJ0/h;->o(F)Landroid/view/animation/Interpolator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/android/launcher3/views/f;->l:Landroid/view/animation/Interpolator;

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object v0, p0, Lcom/android/launcher3/views/f;->l:Landroid/view/animation/Interpolator;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    iget v0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 88
    .line 89
    cmpg-float v4, v0, v3

    .line 90
    .line 91
    if-gez v4, :cond_3

    .line 92
    .line 93
    cmpl-float v4, p1, v2

    .line 94
    .line 95
    if-gtz v4, :cond_4

    .line 96
    .line 97
    :cond_3
    cmpl-float v4, v0, v3

    .line 98
    .line 99
    if-ltz v4, :cond_5

    .line 100
    .line 101
    cmpg-float v4, p1, v2

    .line 102
    .line 103
    if-gez v4, :cond_5

    .line 104
    .line 105
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 106
    .line 107
    .line 108
    iget v0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 109
    .line 110
    sub-float v0, v3, v0

    .line 111
    .line 112
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-static {p1, v0}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 117
    .line 118
    .line 119
    move-result-wide v0

    .line 120
    invoke-virtual {p0, v3, v0, v1}, Lcom/android/launcher3/views/f;->m0(FJ)Lcom/android/launcher3/anim/q;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_5
    cmpl-float v0, v0, v3

    .line 129
    .line 130
    if-ltz v0, :cond_6

    .line 131
    .line 132
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->handleClose(Z)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_6
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 137
    .line 138
    .line 139
    iget v0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 140
    .line 141
    invoke-static {p1, v0}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 142
    .line 143
    .line 144
    move-result-wide v0

    .line 145
    invoke-virtual {p0, v2, v0, v1}, Lcom/android/launcher3/views/f;->m0(FJ)Lcom/android/launcher3/anim/q;

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    sget-object v0, Lcom/android/launcher3/anim/L;->g:Landroid/view/animation/Interpolator;

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 2
    .line 3
    const p2, 0x3f19999a    # 0.6f

    .line 4
    .line 5
    .line 6
    cmpl-float p1, p1, p2

    .line 7
    .line 8
    if-ltz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/widget/o;->Q:Z

    .line 14
    .line 15
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1
    const-string v0, "Main"

    .line 2
    .line 3
    const-string v1, "Widgets.onLongClick"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->cancelLongPress()V

    .line 9
    .line 10
    .line 11
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 17
    .line 18
    check-cast v0, Lcom/android/launcher3/v;

    .line 19
    .line 20
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0, p1}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    check-cast p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 40
    .line 41
    check-cast v0, Lcom/android/launcher3/v;

    .line 42
    .line 43
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0, p1}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    :goto_0
    if-eqz p1, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return p1

    .line 57
    :cond_2
    return v1
.end method

.method public setEffectViewAlpha(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->O:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->E:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getWidgetListHorizontalMargin()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget v0, p0, Lcom/android/launcher3/widget/o;->F:I

    .line 11
    .line 12
    if-eq p1, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->N0(I)V

    .line 15
    .line 16
    .line 17
    iput p1, p0, Lcom/android/launcher3/widget/o;->F:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public setScaleY(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, LG2/c;->j()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget p1, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setTranslationShift(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->setTranslationShift(F)V

    .line 2
    .line 3
    .line 4
    instance-of p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    instance-of p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    instance-of p1, p0, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->W0()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public shrink(Z)V
    .locals 3

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    instance-of v0, p0, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    instance-of v0, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 18
    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    const-wide/16 v0, 0xc8

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, v2, v0, v1}, Lcom/android/launcher3/views/f;->Y(ZJ)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateFull()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    const-wide/16 v0, 0x104

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/widget/o;->w0(J)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateHalf()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0, v2, v0, v1}, Lcom/android/launcher3/views/f;->Y(ZJ)V

    .line 49
    .line 50
    .line 51
    :cond_3
    return-void
.end method

.method public w0(J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3f19999a    # 0.6f

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/launcher3/views/f;->m0(FJ)Lcom/android/launcher3/anim/q;

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget-object p2, Lcom/android/launcher3/anim/L;->b:Landroid/view/animation/Interpolator;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method protected x0(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/o;->V:Z

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    sget-object p0, Lcom/android/launcher3/widget/o;->a0:Ljava/lang/String;

    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v2, "canInterceptMoveEvent: ev = "

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p1, " , return false !"

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return v1

    .line 59
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->T:Landroid/graphics/PointF;

    .line 60
    .line 61
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 62
    .line 63
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->S:Landroid/graphics/PointF;

    .line 64
    .line 65
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 66
    .line 67
    sub-float/2addr v0, v2

    .line 68
    const/4 v2, 0x0

    .line 69
    cmpl-float v0, v0, v2

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    if-lez v0, :cond_3

    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 75
    .line 76
    const/4 v4, -0x1

    .line 77
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->T:Landroid/graphics/PointF;

    .line 84
    .line 85
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 86
    .line 87
    iget-object v4, p0, Lcom/android/launcher3/widget/o;->S:Landroid/graphics/PointF;

    .line 88
    .line 89
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 90
    .line 91
    sub-float/2addr v0, v4

    .line 92
    cmpg-float v0, v0, v2

    .line 93
    .line 94
    if-gez v0, :cond_4

    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 97
    .line 98
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_4

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateHalf()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_5

    .line 109
    .line 110
    :cond_4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->B0(Landroid/view/MotionEvent;)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-eqz p0, :cond_6

    .line 115
    .line 116
    :cond_5
    return v3

    .line 117
    :cond_6
    return v1
.end method

.method protected y0(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/widget/a;->getScrollbar()Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->B0(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v1, 0x1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;->getThumbOffsetY()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 23
    .line 24
    const/4 v0, -0x1

    .line 25
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    :cond_1
    return v1

    .line 40
    :cond_2
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method protected z0()V
    .locals 0

    .line 1
    return-void
.end method
