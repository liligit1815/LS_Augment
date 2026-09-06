.class public final Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;
.super Ljava/lang/Object;
.source "CloseAppFadeInAnimUpdater.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;,
        Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;

.field private static final OUT:I = 0x2

.field private static final TAG:Ljava/lang/String; = "CloseAppFadeInAnimUpdater"

.field private static final VALUE:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final closeAppFadeInAnim:Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

.field private static final f5368IN:I = 0x1


# instance fields
.field private animationRecordId:I

.field private final animator:Landroid/animation/ValueAnimator;

.field private mFirstRun:Z

.field private final mOriginalDuration:J

.field private final mOriginalFromValue:F

.field private final mOriginalToValue:F

.field private mValue:F

.field private tag:Ljava/lang/Object;

.field private target:Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;

.field private targetView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->INSTANCE:Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$Companion;

    .line 8
    .line 9
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$1;

    .line 12
    .line 13
    const-string v2, "CloseAppFadeInTarget"

    .line 14
    .line 15
    invoke-direct {v1, v0, v2}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sput-object v1, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->VALUE:Landroid/util/Property;

    .line 19
    .line 20
    new-instance v0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    const/high16 v2, 0x3f800000    # 1.0f

    .line 24
    .line 25
    const-wide/16 v3, 0xfa

    .line 26
    .line 27
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;-><init>(JFF)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->closeAppFadeInAnim:Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(JFF)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mFirstRun:Z

    .line 6
    .line 7
    sget-object v1, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->VALUE:Landroid/util/Property;

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    new-array v2, v2, [F

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    aput p3, v2, v3

    .line 14
    .line 15
    aput p4, v2, v0

    .line 16
    .line 17
    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, p1, p2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "ofFloat(this, VALUE, fro\u2026ue).setDuration(duration)"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animator:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    iput-wide p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mOriginalDuration:J

    .line 33
    .line 34
    iput p3, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mOriginalFromValue:F

    .line 35
    .line 36
    iput p4, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mOriginalToValue:F

    .line 37
    .line 38
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animationRecordId:I

    .line 2
    .line 3
    return p0
.end method

.method private final animate(I)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animator:Landroid/animation/ValueAnimator;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    const/4 v3, 0x1

    .line 9
    if-ne p1, v3, :cond_0

    .line 10
    .line 11
    iget p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mOriginalToValue:F

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mOriginalFromValue:F

    .line 15
    .line 16
    :goto_0
    iget-boolean v4, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mFirstRun:Z

    .line 17
    .line 18
    if-eqz v4, :cond_1

    .line 19
    .line 20
    iget v4, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mOriginalFromValue:F

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    iget v4, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mValue:F

    .line 24
    .line 25
    :goto_1
    iget-wide v5, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mOriginalDuration:J

    .line 26
    .line 27
    iget-object v7, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animator:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    sub-long v1, v5, v1

    .line 30
    .line 31
    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    const-wide/16 v5, 0x0

    .line 36
    .line 37
    invoke-static {v5, v6, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    invoke-virtual {v7, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animator:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    const/4 v2, 0x2

    .line 47
    new-array v2, v2, [F

    .line 48
    .line 49
    aput v4, v2, v0

    .line 50
    .line 51
    aput p1, v2, v3

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animator:Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 59
    .line 60
    .line 61
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mFirstRun:Z

    .line 62
    .line 63
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mFirstRun:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mValue:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->target:Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->targetView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animationRecordId:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic g(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mFirstRun:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->mValue:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->target:Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater$CloseAppFadeInTarget;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->targetView:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k()Landroid/util/Property;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->VALUE:Landroid/util/Property;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic l()Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->closeAppFadeInAnim:Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final animateIn()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animate(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final animateOut()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animate(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final end()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final getAnimator()Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTag()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->tag:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setTag(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/CloseAppFadeInAnimUpdater;->tag:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method
