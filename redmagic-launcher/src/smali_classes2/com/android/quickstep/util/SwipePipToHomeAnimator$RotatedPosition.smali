.class final Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;
.super Lcom/android/tools/r8/RecordTag;
.source "SwipePipToHomeAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SwipePipToHomeAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RotatedPosition"
.end annotation


# instance fields
.field private final degree:F

.field private final positionX:F

.field private final positionY:F


# direct methods
.method private constructor <init>(FFF)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/android/tools/r8/RecordTag;-><init>()V

    iput p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->degree:F

    iput p2, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionX:F

    iput p3, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionY:F

    return-void
.end method

.method synthetic constructor <init>(FFFLcom/android/quickstep/util/r1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;-><init>(FFF)V

    return-void
.end method

.method private synthetic a(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;

    .line 6
    .line 7
    iget v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->degree:F

    .line 8
    .line 9
    iget v1, p1, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->degree:F

    .line 10
    .line 11
    cmpl-float v0, v0, v1

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionX:F

    .line 16
    .line 17
    iget v1, p1, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionX:F

    .line 18
    .line 19
    cmpl-float v0, v0, v1

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionY:F

    .line 24
    .line 25
    iget p1, p1, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionY:F

    .line 26
    .line 27
    cmpl-float p0, p0, p1

    .line 28
    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method private synthetic b()[Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->degree:F

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionX:F

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionY:F

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v2, 0x3

    .line 20
    new-array v2, v2, [Ljava/lang/Object;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    aput-object v0, v2, v3

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    aput-object v1, v2, v0

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    aput-object p0, v2, v0

    .line 30
    .line 31
    return-object v2
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->degree:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionX:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionY:F

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public degree()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->degree:F

    .line 2
    .line 3
    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->degree:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionX:F

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionY:F

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/util/q1;->a(FFF)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public positionX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionX:F

    .line 2
    .line 3
    return p0
.end method

.method public positionY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->positionY:F

    .line 2
    .line 3
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->b()[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;

    .line 6
    .line 7
    const-string v1, "degree;positionX;positionY"

    .line 8
    .line 9
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/a6;->a([Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
