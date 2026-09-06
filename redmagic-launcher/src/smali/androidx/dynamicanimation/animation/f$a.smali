.class final Landroidx/dynamicanimation/animation/f$a;
.super Ljava/lang/Object;
.source "FlingAnimation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/dynamicanimation/animation/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field private a:F

.field private b:F

.field private final c:Landroidx/dynamicanimation/animation/e$p;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, -0x3f79999a    # -4.2f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Landroidx/dynamicanimation/animation/f$a;->a:F

    .line 8
    .line 9
    new-instance v0, Landroidx/dynamicanimation/animation/e$p;

    .line 10
    .line 11
    invoke-direct {v0}, Landroidx/dynamicanimation/animation/e$p;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Landroidx/dynamicanimation/animation/f$a;->c:Landroidx/dynamicanimation/animation/e$p;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(FF)Z
    .locals 0

    .line 1
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p0, p0, Landroidx/dynamicanimation/animation/f$a;->b:F

    .line 6
    .line 7
    cmpg-float p0, p1, p0

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method b(F)V
    .locals 1

    .line 1
    const v0, -0x3f79999a    # -4.2f

    .line 2
    .line 3
    .line 4
    mul-float/2addr p1, v0

    .line 5
    iput p1, p0, Landroidx/dynamicanimation/animation/f$a;->a:F

    .line 6
    .line 7
    return-void
.end method

.method c(F)V
    .locals 1

    .line 1
    const/high16 v0, 0x427a0000    # 62.5f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    iput p1, p0, Landroidx/dynamicanimation/animation/f$a;->b:F

    .line 5
    .line 6
    return-void
.end method

.method d(FFJ)Landroidx/dynamicanimation/animation/e$p;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/dynamicanimation/animation/f$a;->c:Landroidx/dynamicanimation/animation/e$p;

    .line 2
    .line 3
    float-to-double v1, p2

    .line 4
    long-to-float p3, p3

    .line 5
    const/high16 p4, 0x447a0000    # 1000.0f

    .line 6
    .line 7
    div-float/2addr p3, p4

    .line 8
    iget p4, p0, Landroidx/dynamicanimation/animation/f$a;->a:F

    .line 9
    .line 10
    mul-float/2addr p3, p4

    .line 11
    float-to-double p3, p3

    .line 12
    invoke-static {p3, p4}, Ljava/lang/Math;->exp(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide p3

    .line 16
    mul-double/2addr v1, p3

    .line 17
    double-to-float p3, v1

    .line 18
    iput p3, v0, Landroidx/dynamicanimation/animation/e$p;->b:F

    .line 19
    .line 20
    iget-object p3, p0, Landroidx/dynamicanimation/animation/f$a;->c:Landroidx/dynamicanimation/animation/e$p;

    .line 21
    .line 22
    iget p4, p3, Landroidx/dynamicanimation/animation/e$p;->b:F

    .line 23
    .line 24
    sub-float p2, p4, p2

    .line 25
    .line 26
    iget v0, p0, Landroidx/dynamicanimation/animation/f$a;->a:F

    .line 27
    .line 28
    div-float/2addr p2, v0

    .line 29
    add-float/2addr p1, p2

    .line 30
    iput p1, p3, Landroidx/dynamicanimation/animation/e$p;->a:F

    .line 31
    .line 32
    invoke-virtual {p0, p1, p4}, Landroidx/dynamicanimation/animation/f$a;->a(FF)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Landroidx/dynamicanimation/animation/f$a;->c:Landroidx/dynamicanimation/animation/e$p;

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    iput p2, p1, Landroidx/dynamicanimation/animation/e$p;->b:F

    .line 42
    .line 43
    :cond_0
    iget-object p0, p0, Landroidx/dynamicanimation/animation/f$a;->c:Landroidx/dynamicanimation/animation/e$p;

    .line 44
    .line 45
    return-object p0
.end method
