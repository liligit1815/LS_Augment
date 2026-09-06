.class public Lu2/h;
.super Ljava/lang/Object;
.source "GhostedViewTransitionAnimatorController.kt"

# interfaces
.implements Lu2/c$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu2/h$a;,
        Lu2/h$b;
    }
.end annotation


# static fields
.field public static final w:Lu2/h$a;


# instance fields
.field private final b:Ljava/lang/Integer;

.field private final c:Landroid/content/ComponentName;

.field private final d:Ljava/lang/Integer;

.field private final e:Z

.field private f:Lcom/android/internal/jank/InteractionJankMonitor;

.field private final g:Lu2/i;

.field private final h:Z

.field private final i:[I

.field private j:Landroid/view/GhostView;

.field private final k:[F

.field private final l:Landroid/graphics/Matrix;

.field private m:Landroid/widget/FrameLayout;

.field private n:Lu2/h$b;

.field private final o:Lh4/e;

.field private p:I

.field private final q:[I

.field private final r:Lu2/F$k;

.field private final s:Landroid/graphics/drawable/Drawable;

.field private final t:Lu2/h$c;

.field private final u:Ljava/lang/String;

.field private final v:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lu2/h$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lu2/h$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lu2/h;->w:Lu2/h$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/view/View;Ljava/lang/Integer;Lu2/c$f;Landroid/content/ComponentName;Ljava/lang/Integer;ZLcom/android/internal/jank/InteractionJankMonitor;Lu2/i;)V
    .locals 9

    move-object/from16 p3, p7

    const-string v0, "transitioningView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "interactionJankMonitor"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lu2/h;->b:Ljava/lang/Integer;

    .line 3
    iput-object p4, p0, Lu2/h;->c:Landroid/content/ComponentName;

    .line 4
    iput-object p5, p0, Lu2/h;->d:Ljava/lang/Integer;

    .line 5
    iput-boolean p6, p0, Lu2/h;->e:Z

    .line 6
    iput-object p3, p0, Lu2/h;->f:Lcom/android/internal/jank/InteractionJankMonitor;

    move-object/from16 p2, p8

    .line 7
    iput-object p2, p0, Lu2/h;->g:Lu2/i;

    const/4 p2, 0x1

    .line 8
    iput-boolean p2, p0, Lu2/h;->h:Z

    const/4 p2, 0x2

    .line 9
    new-array p3, p2, [I

    iput-object p3, p0, Lu2/h;->i:[I

    const/16 p3, 0x9

    .line 10
    new-array v0, p3, [F

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p3, :cond_0

    const/4 v2, 0x0

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iput-object v0, p0, Lu2/h;->k:[F

    .line 11
    new-instance p3, Landroid/graphics/Matrix;

    invoke-direct {p3}, Landroid/graphics/Matrix;-><init>()V

    iput-object p3, p0, Lu2/h;->l:Landroid/graphics/Matrix;

    .line 12
    new-instance p3, Lu2/g;

    invoke-direct {p3, p0}, Lu2/g;-><init>(Lu2/h;)V

    invoke-static {p3}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p3

    iput-object p3, p0, Lu2/h;->o:Lh4/e;

    const/16 p3, 0xff

    .line 13
    iput p3, p0, Lu2/h;->p:I

    .line 14
    new-array p2, p2, [I

    iput-object p2, p0, Lu2/h;->q:[I

    .line 15
    new-instance v0, Lu2/F$k;

    const/16 v7, 0x3f

    const/4 v8, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v8}, Lu2/F$k;-><init>(IIIIFFILkotlin/jvm/internal/j;)V

    iput-object v0, p0, Lu2/h;->r:Lu2/F$k;

    .line 16
    new-instance p2, Lu2/h$c;

    invoke-direct {p2, p0}, Lu2/h$c;-><init>(Lu2/h;)V

    iput-object p2, p0, Lu2/h;->t:Lu2/h$c;

    .line 17
    invoke-static {}, Lcom/android/systemui/Flags;->decoupleViewControllerInAnimlib()Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_1

    .line 18
    iget-object p3, p0, Lu2/h;->g:Lu2/i;

    if-eqz p3, :cond_1

    invoke-interface {p3, p1}, Lu2/i;->b(Landroid/view/View;)Ljava/lang/String;

    move-result-object p3

    goto :goto_1

    :cond_1
    move-object p3, v0

    .line 19
    :goto_1
    iput-object p3, p0, Lu2/h;->u:Ljava/lang/String;

    .line 20
    invoke-static {}, Lcom/android/systemui/Flags;->decoupleViewControllerInAnimlib()Z

    move-result p3

    if-eqz p3, :cond_2

    goto :goto_2

    :cond_2
    move-object v0, p1

    :goto_2
    iput-object v0, p0, Lu2/h;->v:Landroid/view/View;

    .line 21
    instance-of p1, p1, Lu2/j;

    if-eqz p1, :cond_4

    .line 22
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lu2/h;->o(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lu2/h;->s:Landroid/graphics/drawable/Drawable;

    .line 23
    sget-object p1, Lu2/F;->i:Lu2/F$b;

    invoke-virtual {p1}, Lu2/F$b;->i()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lu2/h;->e:Z

    if-eqz p1, :cond_3

    .line 24
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_3
    return-void

    .line 25
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 26
    const-string p1, "A GhostedViewLaunchAnimatorController was created from a View that does not implement LaunchableView. This can lead to subtle bugs where the visibility of the View we are launching from is not what we expected."

    .line 27
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public synthetic constructor <init>(Landroid/view/View;Ljava/lang/Integer;Lu2/c$f;Landroid/content/ComponentName;Ljava/lang/Integer;ZLcom/android/internal/jank/InteractionJankMonitor;Lu2/i;ILkotlin/jvm/internal/j;)V
    .locals 1

    and-int/lit8 p10, p9, 0x2

    const/4 v0, 0x0

    if-eqz p10, :cond_0

    move-object p2, v0

    :cond_0
    and-int/lit8 p10, p9, 0x4

    if-eqz p10, :cond_1

    move-object p3, v0

    :cond_1
    and-int/lit8 p10, p9, 0x8

    if-eqz p10, :cond_2

    move-object p4, v0

    :cond_2
    and-int/lit8 p10, p9, 0x10

    if-eqz p10, :cond_3

    move-object p5, v0

    :cond_3
    and-int/lit8 p10, p9, 0x20

    if-eqz p10, :cond_4

    const/4 p6, 0x0

    :cond_4
    and-int/lit8 p10, p9, 0x40

    if-eqz p10, :cond_5

    .line 28
    invoke-static {}, Lcom/android/internal/jank/InteractionJankMonitor;->getInstance()Lcom/android/internal/jank/InteractionJankMonitor;

    move-result-object p7

    :cond_5
    and-int/lit16 p9, p9, 0x80

    if-eqz p9, :cond_7

    .line 29
    invoke-static {}, Lcom/android/systemui/Flags;->decoupleViewControllerInAnimlib()Z

    move-result p8

    if-eqz p8, :cond_6

    .line 30
    sget-object p8, Lu2/M;->c:Lu2/M$a;

    invoke-virtual {p8}, Lu2/M$a;->a()Lu2/M;

    move-result-object p8

    goto :goto_0

    :cond_6
    move-object p8, v0

    .line 31
    :cond_7
    :goto_0
    invoke-direct/range {p0 .. p8}, Lu2/h;-><init>(Landroid/view/View;Ljava/lang/Integer;Lu2/c$f;Landroid/content/ComponentName;Ljava/lang/Integer;ZLcom/android/internal/jank/InteractionJankMonitor;Lu2/i;)V

    return-void
.end method

.method public static synthetic n(Lu2/h;)Landroid/graphics/Insets;
    .locals 0

    .line 1
    invoke-static {p0}, Lu2/h;->p(Lu2/h;)Landroid/graphics/Insets;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final o(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_1
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_3

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    invoke-virtual {v0, p0}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "removeAt(...)"

    .line 32
    .line 33
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    check-cast v1, Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_2
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 50
    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    check-cast v1, Landroid/view/ViewGroup;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    :goto_0
    if-ge p0, v2, :cond_1

    .line 60
    .line 61
    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    add-int/lit8 p0, p0, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    const/4 p0, 0x0

    .line 72
    return-object p0
.end method

.method private static final p(Lu2/h;)Landroid/graphics/Insets;
    .locals 1

    .line 1
    iget-object p0, p0, Lu2/h;->s:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getOpticalInsets()Landroid/graphics/Insets;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-object p0

    .line 13
    :cond_1
    :goto_0
    sget-object p0, Landroid/graphics/Insets;->NONE:Landroid/graphics/Insets;

    .line 14
    .line 15
    const-string v0, "NONE"

    .line 16
    .line 17
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method private final r()Landroid/graphics/Insets;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/h;->o:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/graphics/Insets;

    .line 8
    .line 9
    return-object p0
.end method

.method private final s()Ljava/lang/Integer;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lu2/h;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lu2/h;->b:Ljava/lang/Integer;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lu2/h;->d:Ljava/lang/Integer;

    .line 11
    .line 12
    return-object p0
.end method

.method private final v()Landroid/view/View;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/systemui/Flags;->decoupleViewControllerInAnimlib()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lu2/h;->u:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lu2/h;->g:Lu2/i;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0, v0}, Lu2/i;->a(Ljava/lang/String;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v1, p0, Lu2/h;->v:Landroid/view/View;

    .line 22
    .line 23
    :cond_1
    :goto_0
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-object v1
.end method

.method private final w()Landroid/view/ViewGroupOverlay;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lu2/h;->l()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getOverlay()Landroid/view/ViewGroupOverlay;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "getOverlay(...)"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method


# virtual methods
.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/h;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public e()Lu2/F$k;
    .locals 9

    .line 1
    new-instance v0, Lu2/F$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Lu2/h;->u()F

    .line 4
    .line 5
    .line 6
    move-result v5

    .line 7
    invoke-virtual {p0}, Lu2/h;->t()F

    .line 8
    .line 9
    .line 10
    move-result v6

    .line 11
    const/16 v7, 0xf

    .line 12
    .line 13
    const/4 v8, 0x0

    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-direct/range {v0 .. v8}, Lu2/F$k;-><init>(IIIIFFILkotlin/jvm/internal/j;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lu2/h;->q(Lu2/F$k;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public f()Lu2/c$f;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public i(Lu2/F$k;FF)V
    .locals 11

    .line 1
    const-string p2, "state"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lu2/h;->j:Landroid/view/GhostView;

    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    goto/16 :goto_1

    .line 11
    .line 12
    :cond_0
    iget-object p3, p0, Lu2/h;->m:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Lu2/F$k;->j()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x4

    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :cond_1
    invoke-virtual {p2}, Landroid/view/GhostView;->getVisibility()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/4 v2, 0x0

    .line 41
    if-ne v0, v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p2, v2}, Landroid/view/GhostView;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Lu2/h;->r:Lu2/F$k;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lu2/h;->q(Lu2/F$k;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Lu2/F$k;->f()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v1, p0, Lu2/h;->r:Lu2/F$k;

    .line 59
    .line 60
    invoke-virtual {v1}, Lu2/F$k;->f()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    sub-int/2addr v0, v1

    .line 65
    invoke-virtual {p1}, Lu2/F$k;->g()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    iget-object v3, p0, Lu2/h;->r:Lu2/F$k;

    .line 70
    .line 71
    invoke-virtual {v3}, Lu2/F$k;->g()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    sub-int/2addr v1, v3

    .line 76
    invoke-virtual {p1}, Lu2/F$k;->h()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    iget-object v4, p0, Lu2/h;->r:Lu2/F$k;

    .line 81
    .line 82
    invoke-virtual {v4}, Lu2/F$k;->h()I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    sub-int/2addr v3, v4

    .line 87
    invoke-virtual {p1}, Lu2/F$k;->a()I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    iget-object v5, p0, Lu2/h;->r:Lu2/F$k;

    .line 92
    .line 93
    invoke-virtual {v5}, Lu2/F$k;->a()I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    sub-int/2addr v4, v5

    .line 98
    invoke-virtual {p1}, Lu2/F$k;->k()I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    int-to-float v5, v5

    .line 103
    iget-object v6, p0, Lu2/h;->r:Lu2/F$k;

    .line 104
    .line 105
    invoke-virtual {v6}, Lu2/F$k;->k()I

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    int-to-float v6, v6

    .line 110
    div-float/2addr v5, v6

    .line 111
    invoke-virtual {p1}, Lu2/F$k;->e()I

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    int-to-float v6, v6

    .line 116
    iget-object v7, p0, Lu2/h;->r:Lu2/F$k;

    .line 117
    .line 118
    invoke-virtual {v7}, Lu2/F$k;->e()I

    .line 119
    .line 120
    .line 121
    move-result v7

    .line 122
    int-to-float v7, v7

    .line 123
    div-float/2addr v6, v7

    .line 124
    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v6

    .line 132
    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    instance-of v6, v6, Landroid/view/ViewGroup;

    .line 137
    .line 138
    if-eqz v6, :cond_3

    .line 139
    .line 140
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    invoke-virtual {p0}, Lu2/h;->l()Landroid/view/ViewGroup;

    .line 145
    .line 146
    .line 147
    move-result-object v7

    .line 148
    iget-object v8, p0, Lu2/h;->l:Landroid/graphics/Matrix;

    .line 149
    .line 150
    invoke-static {v6, v7, v8}, Landroid/view/GhostView;->calculateMatrix(Landroid/view/View;Landroid/view/ViewGroup;Landroid/graphics/Matrix;)V

    .line 151
    .line 152
    .line 153
    :cond_3
    invoke-virtual {p0}, Lu2/h;->l()Landroid/view/ViewGroup;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    iget-object v7, p0, Lu2/h;->i:[I

    .line 158
    .line 159
    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 160
    .line 161
    .line 162
    iget-object v6, p0, Lu2/h;->l:Landroid/graphics/Matrix;

    .line 163
    .line 164
    iget-object v7, p0, Lu2/h;->r:Lu2/F$k;

    .line 165
    .line 166
    invoke-virtual {v7}, Lu2/F$k;->c()F

    .line 167
    .line 168
    .line 169
    move-result v7

    .line 170
    iget-object v8, p0, Lu2/h;->i:[I

    .line 171
    .line 172
    aget v8, v8, v2

    .line 173
    .line 174
    int-to-float v8, v8

    .line 175
    sub-float/2addr v7, v8

    .line 176
    iget-object v8, p0, Lu2/h;->r:Lu2/F$k;

    .line 177
    .line 178
    invoke-virtual {v8}, Lu2/F$k;->d()F

    .line 179
    .line 180
    .line 181
    move-result v8

    .line 182
    iget-object v9, p0, Lu2/h;->i:[I

    .line 183
    .line 184
    const/4 v10, 0x1

    .line 185
    aget v9, v9, v10

    .line 186
    .line 187
    int-to-float v9, v9

    .line 188
    sub-float/2addr v8, v9

    .line 189
    invoke-virtual {v6, v5, v5, v7, v8}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 190
    .line 191
    .line 192
    iget-object v5, p0, Lu2/h;->l:Landroid/graphics/Matrix;

    .line 193
    .line 194
    add-int/2addr v0, v1

    .line 195
    int-to-float v0, v0

    .line 196
    const/high16 v1, 0x40000000    # 2.0f

    .line 197
    .line 198
    div-float/2addr v0, v1

    .line 199
    add-int/2addr v3, v4

    .line 200
    int-to-float v3, v3

    .line 201
    div-float/2addr v3, v1

    .line 202
    invoke-virtual {v5, v0, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Lu2/h;->l:Landroid/graphics/Matrix;

    .line 206
    .line 207
    invoke-virtual {p2, v0}, Landroid/view/GhostView;->setAnimationMatrix(Landroid/graphics/Matrix;)V

    .line 208
    .line 209
    .line 210
    invoke-direct {p0}, Lu2/h;->r()Landroid/graphics/Insets;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    invoke-virtual {p1}, Lu2/F$k;->h()I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    iget v1, p2, Landroid/graphics/Insets;->top:I

    .line 219
    .line 220
    sub-int/2addr v0, v1

    .line 221
    invoke-virtual {p1}, Lu2/F$k;->f()I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    iget v3, p2, Landroid/graphics/Insets;->left:I

    .line 226
    .line 227
    sub-int/2addr v1, v3

    .line 228
    invoke-virtual {p1}, Lu2/F$k;->g()I

    .line 229
    .line 230
    .line 231
    move-result v3

    .line 232
    iget v4, p2, Landroid/graphics/Insets;->right:I

    .line 233
    .line 234
    add-int/2addr v3, v4

    .line 235
    invoke-virtual {p1}, Lu2/F$k;->a()I

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    iget p2, p2, Landroid/graphics/Insets;->bottom:I

    .line 240
    .line 241
    add-int/2addr v4, p2

    .line 242
    iget-object p2, p0, Lu2/h;->i:[I

    .line 243
    .line 244
    aget p2, p2, v10

    .line 245
    .line 246
    sub-int/2addr v0, p2

    .line 247
    invoke-virtual {p3, v0}, Landroid/widget/FrameLayout;->setTop(I)V

    .line 248
    .line 249
    .line 250
    iget-object p2, p0, Lu2/h;->i:[I

    .line 251
    .line 252
    aget p2, p2, v10

    .line 253
    .line 254
    sub-int/2addr v4, p2

    .line 255
    invoke-virtual {p3, v4}, Landroid/widget/FrameLayout;->setBottom(I)V

    .line 256
    .line 257
    .line 258
    iget-object p2, p0, Lu2/h;->i:[I

    .line 259
    .line 260
    aget p2, p2, v2

    .line 261
    .line 262
    sub-int/2addr v1, p2

    .line 263
    invoke-virtual {p3, v1}, Landroid/widget/FrameLayout;->setLeft(I)V

    .line 264
    .line 265
    .line 266
    iget-object p2, p0, Lu2/h;->i:[I

    .line 267
    .line 268
    aget p2, p2, v2

    .line 269
    .line 270
    sub-int/2addr v3, p2

    .line 271
    invoke-virtual {p3, v3}, Landroid/widget/FrameLayout;->setRight(I)V

    .line 272
    .line 273
    .line 274
    iget-object p2, p0, Lu2/h;->n:Lu2/h$b;

    .line 275
    .line 276
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {p2}, Lu2/h$b;->c()Landroid/graphics/drawable/Drawable;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    if-eqz p2, :cond_5

    .line 284
    .line 285
    invoke-virtual {p1}, Lu2/F$k;->i()F

    .line 286
    .line 287
    .line 288
    move-result p3

    .line 289
    invoke-virtual {p1}, Lu2/F$k;->b()F

    .line 290
    .line 291
    .line 292
    move-result p1

    .line 293
    invoke-virtual {p0, p2, p3, p1}, Lu2/h;->y(Landroid/graphics/drawable/Drawable;FF)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_4
    :goto_0
    invoke-virtual {p2}, Landroid/view/GhostView;->getVisibility()I

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    if-nez p1, :cond_5

    .line 302
    .line 303
    invoke-virtual {p2, v1}, Landroid/view/GhostView;->setVisibility(I)V

    .line 304
    .line 305
    .line 306
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    invoke-virtual {p0, v1}, Landroid/view/View;->setTransitionVisibility(I)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p3, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 314
    .line 315
    .line 316
    :cond_5
    :goto_1
    return-void
.end method

.method public j(Z)V
    .locals 2

    .line 1
    iget-object p1, p0, Lu2/h;->j:Landroid/view/GhostView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0}, Lu2/h;->s()Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget-object v0, p0, Lu2/h;->f:Lcom/android/internal/jank/InteractionJankMonitor;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/android/internal/jank/InteractionJankMonitor;->end(I)Z

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object p1, p0, Lu2/h;->n:Lu2/h$b;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    invoke-virtual {p1}, Lu2/h$b;->c()Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    iget v0, p0, Lu2/h;->p:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 35
    .line 36
    .line 37
    :cond_2
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Landroid/view/GhostView;->removeGhost(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lu2/h;->m:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    invoke-direct {p0}, Lu2/h;->w()Landroid/view/ViewGroupOverlay;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, p1}, Landroid/view/ViewGroupOverlay;->remove(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    instance-of p1, p1, Lu2/j;

    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    if-eqz p1, :cond_4

    .line 63
    .line 64
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-string v1, "null cannot be cast to non-null type com.android.systemui.animation.LaunchableView"

    .line 69
    .line 70
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    check-cast p1, Lu2/j;

    .line 74
    .line 75
    invoke-interface {p1, v0}, Lu2/j;->setShouldBlockVisibilityChanges(Z)V

    .line 76
    .line 77
    .line 78
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    check-cast p1, Lu2/j;

    .line 86
    .line 87
    invoke-interface {p1}, Lu2/j;->onActivityLaunchAnimationEnd()V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_4
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const/4 v1, 0x4

    .line 96
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 97
    .line 98
    .line 99
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 104
    .line 105
    .line 106
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 111
    .line 112
    .line 113
    :goto_0
    iget-boolean p1, p0, Lu2/h;->e:Z

    .line 114
    .line 115
    if-nez p1, :cond_6

    .line 116
    .line 117
    invoke-static {}, Lcom/android/systemui/Flags;->decoupleViewControllerInAnimlib()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_5

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_5
    :goto_1
    return-void

    .line 125
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lu2/h;->x()V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public l()Landroid/view/ViewGroup;
    .locals 1

    .line 1
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "null cannot be cast to non-null type android.view.ViewGroup"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    check-cast p0, Landroid/view/ViewGroup;

    .line 15
    .line 16
    return-object p0
.end method

.method public m(Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    instance-of p1, p1, Landroid/view/ViewGroup;

    .line 10
    .line 11
    const-string v0, "GhostedViewTransitionAnimatorController"

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const-string p0, "Skipping animation as ghostedView is not attached to a ViewGroup"

    .line 16
    .line 17
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    new-instance p1, Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-virtual {p0}, Lu2/h;->l()Landroid/view/ViewGroup;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {p1, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lu2/h;->w()Landroid/view/ViewGroupOverlay;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, p1}, Landroid/view/ViewGroupOverlay;->add(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lu2/h;->m:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    iget-object p1, p0, Lu2/h;->s:Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    const/16 p1, 0xff

    .line 53
    .line 54
    :goto_0
    iput p1, p0, Lu2/h;->p:I

    .line 55
    .line 56
    new-instance p1, Lu2/h$b;

    .line 57
    .line 58
    iget-object v1, p0, Lu2/h;->s:Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    invoke-direct {p1, v1}, Lu2/h$b;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lu2/h;->n:Lu2/h$b;

    .line 64
    .line 65
    iget-object v1, p0, Lu2/h;->m:Landroid/widget/FrameLayout;

    .line 66
    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    invoke-virtual {v1, p1}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    instance-of v1, p1, Lu2/j;

    .line 77
    .line 78
    const/4 v2, 0x0

    .line 79
    if-eqz v1, :cond_3

    .line 80
    .line 81
    check-cast p1, Lu2/j;

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    move-object p1, v2

    .line 85
    :goto_1
    if-eqz p1, :cond_4

    .line 86
    .line 87
    const/4 v1, 0x1

    .line 88
    invoke-interface {p1, v1}, Lu2/j;->setShouldBlockVisibilityChanges(Z)V

    .line 89
    .line 90
    .line 91
    :cond_4
    :try_start_0
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0}, Lu2/h;->l()Landroid/view/ViewGroup;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {p1, v1}, Landroid/view/GhostView;->addGhost(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/GhostView;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Lu2/h;->j:Landroid/view/GhostView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :catch_0
    move-exception p1

    .line 107
    const-string v1, "Failed to create ghostView"

    .line 108
    .line 109
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 110
    .line 111
    .line 112
    :goto_2
    iget-object p1, p0, Lu2/h;->j:Landroid/view/GhostView;

    .line 113
    .line 114
    if-eqz p1, :cond_5

    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/view/GhostView;->getParent()Landroid/view/ViewParent;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    if-eqz p1, :cond_5

    .line 121
    .line 122
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    goto :goto_3

    .line 127
    :cond_5
    move-object p1, v2

    .line 128
    :goto_3
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 129
    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    move-object v2, p1

    .line 133
    check-cast v2, Landroid/view/ViewGroup;

    .line 134
    .line 135
    :cond_6
    if-eqz v2, :cond_7

    .line 136
    .line 137
    const/4 p1, 0x0

    .line 138
    invoke-virtual {v2, p1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v2, p1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 142
    .line 143
    .line 144
    :cond_7
    iget-object p1, p0, Lu2/h;->j:Landroid/view/GhostView;

    .line 145
    .line 146
    if-eqz p1, :cond_8

    .line 147
    .line 148
    invoke-virtual {p1}, Landroid/view/GhostView;->getAnimationMatrix()Landroid/graphics/Matrix;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    if-nez p1, :cond_9

    .line 153
    .line 154
    :cond_8
    sget-object p1, Landroid/graphics/Matrix;->IDENTITY_MATRIX:Landroid/graphics/Matrix;

    .line 155
    .line 156
    const-string v0, "IDENTITY_MATRIX"

    .line 157
    .line 158
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    :cond_9
    iget-object v0, p0, Lu2/h;->k:[F

    .line 162
    .line 163
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 164
    .line 165
    .line 166
    invoke-direct {p0}, Lu2/h;->s()Ljava/lang/Integer;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    if-eqz p1, :cond_a

    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    iget-object v0, p0, Lu2/h;->f:Lcom/android/internal/jank/InteractionJankMonitor;

    .line 177
    .line 178
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {v0, p0, p1}, Lcom/android/internal/jank/InteractionJankMonitor;->begin(Landroid/view/View;I)Z

    .line 183
    .line 184
    .line 185
    :cond_a
    return-void
.end method

.method public final q(Lu2/F$k;)V
    .locals 5

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lu2/h;->q:[I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lu2/h;->r()Landroid/graphics/Insets;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    instance-of v1, v1, Lu2/j;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "null cannot be cast to non-null type com.android.systemui.animation.LaunchableView"

    .line 32
    .line 33
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    check-cast v1, Lu2/j;

    .line 37
    .line 38
    invoke-interface {v1}, Lu2/j;->getPaddingForLaunchAnimation()Landroid/graphics/Rect;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    new-instance v1, Landroid/graphics/Rect;

    .line 44
    .line 45
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object v2, p0, Lu2/h;->q:[I

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    aget v2, v2, v3

    .line 52
    .line 53
    iget v4, v0, Landroid/graphics/Insets;->top:I

    .line 54
    .line 55
    add-int/2addr v2, v4

    .line 56
    iget v4, v1, Landroid/graphics/Rect;->top:I

    .line 57
    .line 58
    add-int/2addr v2, v4

    .line 59
    invoke-virtual {p1, v2}, Lu2/F$k;->p(I)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lu2/h;->q:[I

    .line 63
    .line 64
    aget v2, v2, v3

    .line 65
    .line 66
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    int-to-float v3, v3

    .line 75
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-virtual {v4}, Landroid/view/View;->getScaleY()F

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    mul-float/2addr v3, v4

    .line 84
    invoke-static {v3}, Lx4/a;->a(F)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    add-int/2addr v2, v3

    .line 89
    iget v3, v0, Landroid/graphics/Insets;->bottom:I

    .line 90
    .line 91
    sub-int/2addr v2, v3

    .line 92
    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    .line 93
    .line 94
    add-int/2addr v2, v3

    .line 95
    invoke-virtual {p1, v2}, Lu2/F$k;->l(I)V

    .line 96
    .line 97
    .line 98
    iget-object v2, p0, Lu2/h;->q:[I

    .line 99
    .line 100
    const/4 v3, 0x0

    .line 101
    aget v2, v2, v3

    .line 102
    .line 103
    iget v4, v0, Landroid/graphics/Insets;->left:I

    .line 104
    .line 105
    add-int/2addr v2, v4

    .line 106
    iget v4, v1, Landroid/graphics/Rect;->left:I

    .line 107
    .line 108
    add-int/2addr v2, v4

    .line 109
    invoke-virtual {p1, v2}, Lu2/F$k;->n(I)V

    .line 110
    .line 111
    .line 112
    iget-object v2, p0, Lu2/h;->q:[I

    .line 113
    .line 114
    aget v2, v2, v3

    .line 115
    .line 116
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    int-to-float v3, v3

    .line 125
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    mul-float/2addr v3, p0

    .line 134
    invoke-static {v3}, Lx4/a;->a(F)I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    add-int/2addr v2, p0

    .line 139
    iget p0, v0, Landroid/graphics/Insets;->right:I

    .line 140
    .line 141
    sub-int/2addr v2, p0

    .line 142
    iget p0, v1, Landroid/graphics/Rect;->right:I

    .line 143
    .line 144
    add-int/2addr v2, p0

    .line 145
    invoke-virtual {p1, v2}, Lu2/F$k;->o(I)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method protected t()F
    .locals 3

    .line 1
    iget-object v0, p0, Lu2/h;->s:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    sget-object v2, Lu2/h;->w:Lu2/h$a;

    .line 8
    .line 9
    invoke-virtual {v2, v0}, Lu2/h$a;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/GradientDrawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadii()[F

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    aget v0, v1, v0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadius()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    :goto_0
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    mul-float/2addr v0, p0

    .line 39
    return v0
.end method

.method protected u()F
    .locals 3

    .line 1
    iget-object v0, p0, Lu2/h;->s:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    sget-object v2, Lu2/h;->w:Lu2/h$a;

    .line 8
    .line 9
    invoke-virtual {v2, v0}, Lu2/h$a;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/GradientDrawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadii()[F

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    aget v0, v1, v0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadius()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    :goto_0
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    mul-float/2addr v0, p0

    .line 39
    return v0
.end method

.method public x()V
    .locals 2

    .line 1
    sget-object v0, Lu2/F;->i:Lu2/F$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lu2/F$b;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lu2/h;->v()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lu2/h;->t:Lu2/h$c;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lu2/h;->u:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lu2/h;->g:Lu2/i;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0, v0}, Lu2/i;->c(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method protected y(Landroid/graphics/drawable/Drawable;FF)V
    .locals 1

    .line 1
    const-string v0, "background"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lu2/h;->n:Lu2/h$b;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p2, p3}, Lu2/h$b;->f(FF)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
