.class public final Lu2/F$b;
.super Ljava/lang/Object;
.source "TransitionAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lu2/F;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lu2/F$b;-><init>()V

    return-void
.end method

.method public static final synthetic a(Lu2/F$b;Lu2/F$h;Lu4/l;)Landroid/util/FloatProperty;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lu2/F$b;->d(Lu2/F$h;Lu4/l;)Landroid/util/FloatProperty;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final d(Lu2/F$h;Lu4/l;)Landroid/util/FloatProperty;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu2/F$h;",
            "Lu4/l<",
            "-",
            "Lu2/F$i;",
            "Lh4/t;",
            ">;)",
            "Landroid/util/FloatProperty<",
            "Lu2/F$i;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lu2/F$b$a;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2, p0}, Lu2/F$b$a;-><init>(Lu2/F$h;Lu4/l;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method private final g(FFFF)F
    .locals 0

    .line 1
    mul-float/2addr p2, p1

    .line 2
    sub-float/2addr p2, p3

    .line 3
    div-float/2addr p2, p4

    .line 4
    const/4 p0, 0x0

    .line 5
    const/high16 p1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-static {p2, p0, p1}, Landroid/util/MathUtils;->constrain(FFF)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method


# virtual methods
.method public final b()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lu2/F$b;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 9
    .line 10
    const-string v0, "Long-lived registrations cannot be used when the returnAnimationFrameworkLibrary or the returnAnimationFrameworkLongLived flag are disabled"

    .line 11
    .line 12
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method

.method public final c()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lu2/F$b;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 9
    .line 10
    const-string v0, "isLaunching cannot be false when the returnAnimationFrameworkLibrary flag is disabled"

    .line 11
    .line 12
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method

.method public final e(Lu2/F$l;FJJ)F
    .locals 2

    .line 1
    const-string v0, "timings"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lu2/F$l;->g()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    long-to-float p1, v0

    .line 11
    long-to-float p3, p3

    .line 12
    long-to-float p4, p5

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Lu2/F$b;->g(FFFF)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final f(FFF)F
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Lu2/F$b;->g(FFFF)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final h()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/Flags;->returnAnimationFrameworkLibrary()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/systemui/shared/Flags;->returnAnimationFrameworkLongLived()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final i()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/Flags;->returnAnimationFrameworkLibrary()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final j(Landroid/window/WindowAnimationState;)Lu2/F$k;
    .locals 9

    .line 1
    const-string p0, "<this>"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lu2/F$k;

    .line 7
    .line 8
    const/16 v7, 0x3f

    .line 9
    .line 10
    const/4 v8, 0x0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x0

    .line 16
    const/4 v6, 0x0

    .line 17
    invoke-direct/range {v0 .. v8}, Lu2/F$k;-><init>(IIIIFFILkotlin/jvm/internal/j;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p1, Landroid/window/WindowAnimationState;->bounds:Landroid/graphics/RectF;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    iget v1, p0, Landroid/graphics/RectF;->top:F

    .line 25
    .line 26
    invoke-static {v1}, Lx4/a;->a(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Lu2/F$k;->p(I)V

    .line 31
    .line 32
    .line 33
    iget v1, p0, Landroid/graphics/RectF;->left:F

    .line 34
    .line 35
    invoke-static {v1}, Lx4/a;->a(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v0, v1}, Lu2/F$k;->n(I)V

    .line 40
    .line 41
    .line 42
    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    .line 43
    .line 44
    invoke-static {v1}, Lx4/a;->a(F)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Lu2/F$k;->l(I)V

    .line 49
    .line 50
    .line 51
    iget p0, p0, Landroid/graphics/RectF;->right:F

    .line 52
    .line 53
    invoke-static {p0}, Lx4/a;->a(F)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-virtual {v0, p0}, Lu2/F$k;->o(I)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget p0, p1, Landroid/window/WindowAnimationState;->bottomLeftRadius:F

    .line 61
    .line 62
    iget v1, p1, Landroid/window/WindowAnimationState;->bottomRightRadius:F

    .line 63
    .line 64
    add-float/2addr p0, v1

    .line 65
    const/4 v1, 0x2

    .line 66
    int-to-float v1, v1

    .line 67
    div-float/2addr p0, v1

    .line 68
    invoke-virtual {v0, p0}, Lu2/F$k;->m(F)V

    .line 69
    .line 70
    .line 71
    iget p0, p1, Landroid/window/WindowAnimationState;->topLeftRadius:F

    .line 72
    .line 73
    iget p1, p1, Landroid/window/WindowAnimationState;->topRightRadius:F

    .line 74
    .line 75
    add-float/2addr p0, p1

    .line 76
    div-float/2addr p0, v1

    .line 77
    invoke-virtual {v0, p0}, Lu2/F$k;->q(F)V

    .line 78
    .line 79
    .line 80
    return-object v0
.end method
