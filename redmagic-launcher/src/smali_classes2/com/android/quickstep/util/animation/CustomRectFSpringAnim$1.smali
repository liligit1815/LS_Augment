.class Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$1;
.super Ljava/lang/Object;
.source "CustomRectFSpringAnim.java"

# interfaces
.implements Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->initProperty()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$1;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/android/quickstep/util/animation/MultiDynamicAnimation;)V
    .locals 1

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$1;->this$0:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->onUpdate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
