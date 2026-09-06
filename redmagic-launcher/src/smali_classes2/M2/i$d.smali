.class public final LM2/i$d;
.super Ljava/lang/Object;
.source "PhysicsAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LM2/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 6
    invoke-static {}, LM2/j;->a()LM2/i$d;

    move-result-object v0

    iget v0, v0, LM2/i$d;->a:F

    invoke-direct {p0, v0}, LM2/i$d;-><init>(F)V

    return-void
.end method

.method public constructor <init>(F)V
    .locals 2

    .line 7
    invoke-static {}, LM2/j;->a()LM2/i$d;

    move-result-object v0

    iget v0, v0, LM2/i$d;->b:F

    invoke-static {}, LM2/j;->a()LM2/i$d;

    move-result-object v1

    iget v1, v1, LM2/i$d;->c:F

    invoke-direct {p0, p1, v0, v1}, LM2/i$d;-><init>(FFF)V

    return-void
.end method

.method public constructor <init>(FFF)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, p3, v0}, LM2/i$d;-><init>(FFFF)V

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, LM2/i$d;->a:F

    .line 3
    iput p2, p0, LM2/i$d;->b:F

    .line 4
    iput p3, p0, LM2/i$d;->c:F

    .line 5
    iput p4, p0, LM2/i$d;->d:F

    return-void
.end method


# virtual methods
.method public final a(Landroidx/dynamicanimation/animation/f;)V
    .locals 1

    .line 1
    const-string v0, "anim"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, LM2/i$d;->a:F

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/f;->x(F)Landroidx/dynamicanimation/animation/f;

    .line 9
    .line 10
    .line 11
    iget v0, p0, LM2/i$d;->b:F

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/f;->z(F)Landroidx/dynamicanimation/animation/f;

    .line 14
    .line 15
    .line 16
    iget v0, p0, LM2/i$d;->c:F

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/f;->y(F)Landroidx/dynamicanimation/animation/f;

    .line 19
    .line 20
    .line 21
    iget p0, p0, LM2/i$d;->d:F

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroidx/dynamicanimation/animation/f;->A(F)Landroidx/dynamicanimation/animation/f;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final b()F
    .locals 0

    .line 1
    iget p0, p0, LM2/i$d;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public final c()F
    .locals 0

    .line 1
    iget p0, p0, LM2/i$d;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public final d(F)V
    .locals 0

    .line 1
    iput p1, p0, LM2/i$d;->c:F

    .line 2
    .line 3
    return-void
.end method

.method public final e(F)V
    .locals 0

    .line 1
    iput p1, p0, LM2/i$d;->b:F

    .line 2
    .line 3
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, LM2/i$d;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, LM2/i$d;

    .line 12
    .line 13
    iget v1, p0, LM2/i$d;->a:F

    .line 14
    .line 15
    iget v3, p1, LM2/i$d;->a:F

    .line 16
    .line 17
    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget v1, p0, LM2/i$d;->b:F

    .line 25
    .line 26
    iget v3, p1, LM2/i$d;->b:F

    .line 27
    .line 28
    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    iget v1, p0, LM2/i$d;->c:F

    .line 36
    .line 37
    iget v3, p1, LM2/i$d;->c:F

    .line 38
    .line 39
    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_4

    .line 44
    .line 45
    return v2

    .line 46
    :cond_4
    iget p0, p0, LM2/i$d;->d:F

    .line 47
    .line 48
    iget p1, p1, LM2/i$d;->d:F

    .line 49
    .line 50
    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_5

    .line 55
    .line 56
    return v2

    .line 57
    :cond_5
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, LM2/i$d;->a:F

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Float;->hashCode(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget v1, p0, LM2/i$d;->b:F

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Float;->hashCode(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget v1, p0, LM2/i$d;->c:F

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Float;->hashCode(F)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x1f

    .line 26
    .line 27
    iget p0, p0, LM2/i$d;->d:F

    .line 28
    .line 29
    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    add-int/2addr v0, p0

    .line 34
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget v0, p0, LM2/i$d;->a:F

    .line 2
    .line 3
    iget v1, p0, LM2/i$d;->b:F

    .line 4
    .line 5
    iget v2, p0, LM2/i$d;->c:F

    .line 6
    .line 7
    iget p0, p0, LM2/i$d;->d:F

    .line 8
    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v4, "FlingConfig(friction="

    .line 15
    .line 16
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, ", min="

    .line 23
    .line 24
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v0, ", max="

    .line 31
    .line 32
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v0, ", startVelocity="

    .line 39
    .line 40
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, ")"

    .line 47
    .line 48
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method
