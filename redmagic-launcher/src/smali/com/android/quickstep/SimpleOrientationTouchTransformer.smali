.class public Lcom/android/quickstep/SimpleOrientationTouchTransformer;
.super Ljava/lang/Object;
.source "SimpleOrientationTouchTransformer.java"

# interfaces
.implements Lcom/android/launcher3/util/Z$b;


# static fields
.field public static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/SimpleOrientationTouchTransformer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mDisplayId:I

.field private mOrientationRectF:Lcom/android/quickstep/OrientationRectF;

.field private mTouchingOrientationRectF:Lcom/android/quickstep/OrientationRectF;

.field private mViewRotation:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/B4;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/B4;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/K;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mDisplayId:I

    .line 6
    .line 7
    invoke-virtual {p2, p0, v0}, Lcom/android/launcher3/util/Z;->p(Lcom/android/launcher3/util/Z$b;I)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lcom/android/quickstep/A4;

    .line 11
    .line 12
    invoke-direct {v1, p0, p2}, Lcom/android/quickstep/A4;-><init>(Lcom/android/quickstep/SimpleOrientationTouchTransformer;Lcom/android/launcher3/util/Z;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3, v1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/Z;->x(I)Lcom/android/launcher3/util/Z$c;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const/16 p3, 0xff

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/SimpleOrientationTouchTransformer;Lcom/android/launcher3/util/Z;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->lambda$new$0(Lcom/android/launcher3/util/Z;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$0(Lcom/android/launcher3/util/Z;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mDisplayId:I

    .line 2
    .line 3
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/util/Z;->Q(Lcom/android/launcher3/util/Z$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public clearTouchingOrientation()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mTouchingOrientationRectF:Lcom/android/quickstep/OrientationRectF;

    .line 3
    .line 4
    return-void
.end method

.method public onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 6

    .line 1
    and-int/lit8 p1, p3, 0x3

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/android/quickstep/OrientationRectF;

    .line 7
    .line 8
    iget-object p1, p2, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 9
    .line 10
    iget p3, p1, Landroid/graphics/Point;->y:I

    .line 11
    .line 12
    int-to-float v3, p3

    .line 13
    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 14
    .line 15
    int-to-float v4, p1

    .line 16
    iget v5, p2, Lcom/android/launcher3/util/Z$c;->b:I

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/OrientationRectF;-><init>(FFFFI)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mOrientationRectF:Lcom/android/quickstep/OrientationRectF;

    .line 24
    .line 25
    return-void
.end method

.method public transform(Landroid/view/MotionEvent;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mTouchingOrientationRectF:Lcom/android/quickstep/OrientationRectF;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget p0, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mViewRotation:I

    .line 7
    .line 8
    invoke-virtual {v0, p1, p0, v1}, Lcom/android/quickstep/OrientationRectF;->applyTransformToRotation(Landroid/view/MotionEvent;IZ)Z

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mOrientationRectF:Lcom/android/quickstep/OrientationRectF;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, v1}, Lcom/android/quickstep/OrientationRectF;->applyTransformToRotation(Landroid/view/MotionEvent;IZ)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public updateTouchingOrientation(I)V
    .locals 6

    .line 1
    iput p1, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mViewRotation:I

    .line 2
    .line 3
    new-instance v0, Lcom/android/quickstep/OrientationRectF;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mOrientationRectF:Lcom/android/quickstep/OrientationRectF;

    .line 6
    .line 7
    iget v1, p1, Landroid/graphics/RectF;->left:F

    .line 8
    .line 9
    iget v2, p1, Landroid/graphics/RectF;->top:F

    .line 10
    .line 11
    iget v3, p1, Landroid/graphics/RectF;->right:F

    .line 12
    .line 13
    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/quickstep/OrientationRectF;->getRotation()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/OrientationRectF;-><init>(FFFFI)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->mTouchingOrientationRectF:Lcom/android/quickstep/OrientationRectF;

    .line 23
    .line 24
    return-void
.end method
