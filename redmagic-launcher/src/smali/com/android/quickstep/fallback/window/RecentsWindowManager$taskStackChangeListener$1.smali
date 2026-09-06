.class public final Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;
.super Ljava/lang/Object;
.source "RecentsWindowManager.kt"

# interfaces
.implements Lcom/android/systemui/shared/system/TaskStackChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/fallback/window/RecentsWindowManager;-><init>(Landroid/content/Context;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/fallback/window/RecentsWindowManager;


# direct methods
.method constructor <init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTaskMovedToFront(I)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->access$isShowing(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 10
    .line 11
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->isInState(Lcom/android/quickstep/fallback/RecentsState;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowManager$taskStackChangeListener$1;->this$0:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->access$cleanupRecentsWindow(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
