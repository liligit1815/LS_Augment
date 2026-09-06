.class Lcom/zte/toolsdk/producer/AnimationEndContentProvider$1;
.super Ljava/lang/Object;
.source "AnimationEndContentProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/producer/AnimationEndContentProvider;->notifyAnimationEndListeners(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zte/toolsdk/producer/AnimationEndContentProvider;

.field final synthetic val$animationEnded:Z


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/producer/AnimationEndContentProvider;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/AnimationEndContentProvider$1;->this$0:Lcom/zte/toolsdk/producer/AnimationEndContentProvider;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/zte/toolsdk/producer/AnimationEndContentProvider$1;->val$animationEnded:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/producer/AnimationEndContentProvider$1;->this$0:Lcom/zte/toolsdk/producer/AnimationEndContentProvider;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/toolsdk/producer/AnimationEndContentProvider;->a(Lcom/zte/toolsdk/producer/AnimationEndContentProvider;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/zte/toolsdk/producer/AnimationEndContentProvider$1;->this$0:Lcom/zte/toolsdk/producer/AnimationEndContentProvider;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/zte/toolsdk/producer/AnimationEndContentProvider;->a(Lcom/zte/toolsdk/producer/AnimationEndContentProvider;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/zte/toolsdk/producer/AnimationEndContentProvider$OnAnimationEndListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    :try_start_1
    iget-boolean v3, p0, Lcom/zte/toolsdk/producer/AnimationEndContentProvider$1;->val$animationEnded:Z

    .line 31
    .line 32
    invoke-interface {v2, v3}, Lcom/zte/toolsdk/producer/AnimationEndContentProvider$OnAnimationEndListener;->onAnimationEnd(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    goto :goto_1

    .line 38
    :catch_0
    move-exception v2

    .line 39
    :try_start_2
    const-string v3, "AnimationEndProvider"

    .line 40
    .line 41
    new-instance v4, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v5, "Error notifying listener: "

    .line 47
    .line 48
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    monitor-exit v0

    .line 67
    return-void

    .line 68
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 69
    throw p0
.end method
