.class public Lcom/android/launcher3/touch/H;
.super Lcom/android/launcher3/touch/g;
.source "SingleAxisSwipeDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/touch/H$d;,
        Lcom/android/launcher3/touch/H$c;
    }
.end annotation


# static fields
.field public static final w:Lcom/android/launcher3/touch/H$c;

.field public static final x:Lcom/android/launcher3/touch/H$c;


# instance fields
.field private final s:Lcom/android/launcher3/touch/H$c;

.field private final t:Lcom/android/launcher3/touch/H$d;

.field private u:I

.field private v:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/touch/H$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/touch/H$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/touch/H$b;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/launcher3/touch/H$b;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/touch/H;->x:Lcom/android/launcher3/touch/H$c;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/touch/H$d;Lcom/android/launcher3/touch/H$c;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/touch/g;-><init>(Landroid/content/Context;Landroid/view/ViewConfiguration;Z)V

    .line 14
    .line 15
    .line 16
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    iput p1, p0, Lcom/android/launcher3/touch/H;->v:F

    .line 19
    .line 20
    iput-object p2, p0, Lcom/android/launcher3/touch/H;->t:Lcom/android/launcher3/touch/H$d;

    .line 21
    .line 22
    iput-object p3, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 23
    .line 24
    return-void
.end method

.method private u(F)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/touch/H;->u:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/H$c;->c(F)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private v(F)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/touch/H;->u:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    and-int/2addr v0, v1

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/H$c;->d(F)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method


# virtual methods
.method protected n(Landroid/graphics/PointF;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/H$c;->a(Landroid/graphics/PointF;)F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/touch/H;->t:Lcom/android/launcher3/touch/H$d;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Lcom/android/launcher3/touch/H$d;->onDragEnd(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected p(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/touch/g;->l:Landroid/graphics/PointF;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/touch/H$c;->a(Landroid/graphics/PointF;)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/touch/H;->t:Lcom/android/launcher3/touch/H$d;

    .line 10
    .line 11
    xor-int/lit8 p1, p1, 0x1

    .line 12
    .line 13
    invoke-interface {p0, p1, v0}, Lcom/android/launcher3/touch/H$d;->onDragStart(ZF)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method protected r(Landroid/graphics/PointF;Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/H;->t:Lcom/android/launcher3/touch/H$d;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Lcom/android/launcher3/touch/H$c;->a(Landroid/graphics/PointF;)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/H$c;->b(Landroid/graphics/PointF;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-interface {v0, v1, p0, p2}, Lcom/android/launcher3/touch/H$d;->onDrag(FFLandroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method protected t(Landroid/graphics/PointF;)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/touch/g;->e:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/touch/H;->v:F

    .line 4
    .line 5
    mul-float/2addr v0, v1

    .line 6
    iget-object v1, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Lcom/android/launcher3/touch/H$c;->b(Landroid/graphics/PointF;)F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Lcom/android/launcher3/touch/H$c;->a(Landroid/graphics/PointF;)F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    cmpg-float v0, v1, v0

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    if-gez v0, :cond_0

    .line 34
    .line 35
    return v1

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/H$c;->a(Landroid/graphics/PointF;)F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/H;->u(F)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/H;->v(F)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return v1

    .line 56
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 57
    return p0
.end method

.method public w(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/touch/H;->u:I

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/touch/g;->p:Z

    .line 4
    .line 5
    return-void
.end method

.method public x(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/touch/H;->v:F

    .line 2
    .line 3
    return-void
.end method

.method public y()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/H;->s:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/touch/g;->l:Landroid/graphics/PointF;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/touch/H$c;->a(Landroid/graphics/PointF;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/touch/H$c;->d(F)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
