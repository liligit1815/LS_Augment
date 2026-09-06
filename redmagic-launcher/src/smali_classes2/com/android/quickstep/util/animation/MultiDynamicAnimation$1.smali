.class Lcom/android/quickstep/util/animation/MultiDynamicAnimation$1;
.super Ljava/lang/Object;
.source "MultiDynamicAnimation.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->doAnimationFrame(J)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

.field final synthetic val$j9:J

.field final synthetic val$zArr:[Z


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/MultiDynamicAnimation;J[Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$1;->this$0:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$1;->val$j9:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$1;->val$zArr:[Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$1;->val$j9:J

    .line 2
    .line 3
    iget-object v2, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$1;->this$0:Lcom/android/quickstep/util/animation/MultiDynamicAnimation;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$1;->val$zArr:[Z

    .line 6
    .line 7
    check-cast p1, Lcom/android/quickstep/util/animation/SpringHolder;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->doAnimationFrame$lambda$2(JLcom/android/quickstep/util/animation/MultiDynamicAnimation;[ZLcom/android/quickstep/util/animation/SpringHolder;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
