.class Lcom/zte/toolsdk/producer/ToolsExecutor$1;
.super Landroid/app/KeyguardManager$KeyguardDismissCallback;
.source "ToolsExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/producer/ToolsExecutor;->requestDismissKeyguard(Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$listener:Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/producer/ToolsExecutor;Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/zte/toolsdk/producer/ToolsExecutor$1;->val$listener:Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/app/KeyguardManager$KeyguardDismissCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDismissCancelled()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/KeyguardManager$KeyguardDismissCallback;->onDismissCancelled()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDismissError()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/KeyguardManager$KeyguardDismissCallback;->onDismissError()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDismissSucceeded()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/KeyguardManager$KeyguardDismissCallback;->onDismissSucceeded()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor$1;->val$listener:Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;->onDismissSucceeded()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
