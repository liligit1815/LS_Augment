.class public final Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;
.super Ljava/lang/Object;
.source "MultiDynamicAnimation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/MultiDynamicAnimation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MessState"
.end annotation


# instance fields
.field private mValue:F

.field private mVelocity:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->mValue:F

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->mVelocity:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final getMValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->mValue:F

    .line 2
    .line 3
    return p0
.end method

.method public final getMVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->mVelocity:F

    .line 2
    .line 3
    return p0
.end method

.method public final setMValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->mValue:F

    .line 2
    .line 3
    return-void
.end method

.method public final setMVelocity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->mVelocity:F

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "mValue="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->mValue:F

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", mVelocity="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;->mVelocity:F

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, ";"

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
