.class Lcom/android/quickstep/util/animation/RectTransformHelper$1;
.super Ljava/lang/Object;
.source "RectTransformHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/RectTransformHelper;->applySurfaceParams(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;[Lu2/s;ILcom/android/quickstep/util/SurfaceTransaction;Lu2/s$a;Landroid/graphics/RectF;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/animation/RectTransformHelper;

.field final synthetic val$breakParam:Lu2/s$a;

.field final synthetic val$needWindowCrop:Z

.field final synthetic val$remoteAnimationTargetCompat:Lu2/s;

.field final synthetic val$transaction:Lcom/android/quickstep/util/SurfaceTransaction;

.field final synthetic val$transformParams:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/RectTransformHelper;Lu2/s;Lcom/android/quickstep/util/SurfaceTransaction;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;ZLu2/s$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->this$0:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$remoteAnimationTargetCompat:Lu2/s;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$transaction:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$transformParams:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$needWindowCrop:Z

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$breakParam:Lu2/s$a;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$remoteAnimationTargetCompat:Lu2/s;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->this$0:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$transaction:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$transformParams:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$needWindowCrop:Z

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;->val$breakParam:Lu2/s$a;

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/util/animation/RectTransformHelper;->applySurfaceParams$lambda$5$lambda$3(Lu2/s;Lcom/android/quickstep/util/animation/RectTransformHelper;Lcom/android/quickstep/util/SurfaceTransaction;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;ZLu2/s$a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
