.class Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;
.super Ljava/lang/Object;
.source "AnimatorControllerWithResistance.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/AnimatorControllerWithResistance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RecentsParams"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<SCA",
        "LE:Ljava/lang/Object;",
        "TRANS",
        "LATION:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final context:Landroid/content/Context;

.field public final dp:Lcom/android/launcher3/h0;

.field public needChangeEndScale:Z

.field public final recentsOrientedState:Lcom/android/quickstep/util/RecentsOrientedState;

.field public resistAnim:Lcom/android/launcher3/anim/V;

.field public resistanceParams:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

.field public final scaleProperty:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "TSCA",
            "LE;",
            ">;"
        }
    .end annotation
.end field

.field public final scaleTarget:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TSCA",
            "LE;"
        }
    .end annotation
.end field

.field public startScale:F

.field public startTranslation:F

.field public final translationProperty:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "TTRANS",
            "LATION;",
            ">;"
        }
    .end annotation
.end field

.field public final translationTarget:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TTRANS",
            "LATION;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/quickstep/util/RecentsOrientedState;",
            "Lcom/android/launcher3/h0;",
            "TSCA",
            "LE;",
            "Landroid/util/FloatProperty<",
            "TSCA",
            "LE;",
            ">;TTRANS",
            "LATION;",
            "Landroid/util/FloatProperty<",
            "TTRANS",
            "LATION;",
            ">;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistAnim:Lcom/android/launcher3/anim/V;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    iput v0, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->startScale:F

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->startTranslation:F

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->needChangeEndScale:Z

    .line 7
    iput-object p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->context:Landroid/content/Context;

    .line 8
    iput-object p2, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->recentsOrientedState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 9
    iput-object p3, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->dp:Lcom/android/launcher3/h0;

    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->scaleTarget:Ljava/lang/Object;

    .line 11
    iput-object p5, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->scaleProperty:Landroid/util/FloatProperty;

    .line 12
    iput-object p6, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->translationTarget:Ljava/lang/Object;

    .line 13
    iput-object p7, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->translationProperty:Landroid/util/FloatProperty;

    .line 14
    iget-boolean p1, p3, Lcom/android/launcher3/h0;->G0:Z

    if-eqz p1, :cond_0

    .line 15
    sget-object p1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_TABLET:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    iput-object p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistanceParams:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    return-void

    .line 16
    :cond_0
    sget-object p1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    iput-object p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistanceParams:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;Lcom/android/quickstep/util/k;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;-><init>(Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;)V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;Lcom/android/launcher3/anim/V;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->setResistAnim(Lcom/android/launcher3/anim/V;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->setResistanceParams(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;F)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->setStartScale(F)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private setNeedChangeEndScale(Z)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->needChangeEndScale:Z

    .line 2
    .line 3
    return-object p0
.end method

.method private setResistAnim(Lcom/android/launcher3/anim/V;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistAnim:Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    return-object p0
.end method

.method private setResistanceParams(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistanceParams:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 2
    .line 3
    return-object p0
.end method

.method private setStartScale(F)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->startScale:F

    .line 2
    .line 3
    return-object p0
.end method

.method private setStartTranslation(F)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->startTranslation:F

    .line 2
    .line 3
    return-object p0
.end method
