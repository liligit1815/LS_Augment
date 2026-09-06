.class Lcom/android/quickstep/views/RecentsView$27$1;
.super Ljava/lang/Object;
.source "RecentsView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/RecentsView$27;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/quickstep/views/RecentsView$27;

.field final synthetic val$availMemory:J

.field final synthetic val$manager:Landroid/app/ActivityManager;

.field final synthetic val$memInfo:Landroid/app/ActivityManager$MemoryInfo;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView$27;Landroid/app/ActivityManager;Landroid/app/ActivityManager$MemoryInfo;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsView$27$1;->this$1:Lcom/android/quickstep/views/RecentsView$27;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/views/RecentsView$27$1;->val$manager:Landroid/app/ActivityManager;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/views/RecentsView$27$1;->val$memInfo:Landroid/app/ActivityManager$MemoryInfo;

    .line 6
    .line 7
    iput-wide p4, p0, Lcom/android/quickstep/views/RecentsView$27$1;->val$availMemory:J

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$27$1;->val$manager:Landroid/app/ActivityManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView$27$1;->val$memInfo:Landroid/app/ActivityManager$MemoryInfo;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView$27$1;->val$memInfo:Landroid/app/ActivityManager$MemoryInfo;

    .line 11
    .line 12
    iget-wide v0, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    .line 13
    .line 14
    iget-wide v2, p0, Lcom/android/quickstep/views/RecentsView$27$1;->val$availMemory:J

    .line 15
    .line 16
    sub-long/2addr v0, v2

    .line 17
    sget-object v2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 18
    .line 19
    new-instance v3, Lcom/android/quickstep/views/RecentsView$27$1$1;

    .line 20
    .line 21
    invoke-direct {v3, p0, v0, v1}, Lcom/android/quickstep/views/RecentsView$27$1$1;-><init>(Lcom/android/quickstep/views/RecentsView$27$1;J)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
