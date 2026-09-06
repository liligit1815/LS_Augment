.class Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;
.super Ljava/lang/Object;
.source "CustomRectFSpringAnim.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->reverseToOpen(Landroid/graphics/RectF;FLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

.field final synthetic val$afterReverse:Ljava/lang/Runnable;

.field final synthetic val$f9:F

.field final synthetic val$targetRectF:Landroid/graphics/RectF;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;FLandroid/graphics/RectF;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;->val$f9:F

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;->val$targetRectF:Landroid/graphics/RectF;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;->val$afterReverse:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;->val$f9:F

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;->val$targetRectF:Landroid/graphics/RectF;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$3;->val$afterReverse:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->reverseToOpen$lambda$6(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;FLandroid/graphics/RectF;Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
