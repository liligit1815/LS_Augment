.class public final Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;
.super Ljava/lang/Object;
.source "MultiValueUpdateListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/MultiValueUpdateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "FloatProp"
.end annotation


# instance fields
.field private final mDelay:F

.field private final mDuration:F

.field private final mEnd:F

.field private final mInterpolator:Landroid/view/animation/Interpolator;

.field private final mStart:F

.field public value:F


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput p2, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mStart:F

    iput p2, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 10
    iput p3, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mEnd:F

    .line 11
    iput p4, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mDelay:F

    .line 12
    iput p5, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mDuration:F

    .line 13
    iput-object p6, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 14
    invoke-static {p1}, Lcom/android/quickstep/util/MultiValueUpdateListener;->a(Lcom/android/quickstep/util/MultiValueUpdateListener;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p2, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mStart:F

    iput p2, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 3
    iput p3, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mEnd:F

    .line 4
    iput-object p4, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mInterpolator:Landroid/view/animation/Interpolator;

    const/high16 p2, -0x40800000    # -1.0f

    .line 5
    iput p2, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mDelay:F

    .line 6
    iput p2, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mDuration:F

    .line 7
    invoke-static {p1}, Lcom/android/quickstep/util/MultiValueUpdateListener;->a(Lcom/android/quickstep/util/MultiValueUpdateListener;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mDelay:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mDuration:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mEnd:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mStart:F

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public getStartValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->mStart:F

    .line 2
    .line 3
    return p0
.end method
