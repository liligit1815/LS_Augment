.class public final synthetic LR1/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/stk/SimCardLoadReceiver;

.field public final synthetic h:Landroid/content/Context;

.field public final synthetic i:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/stk/SimCardLoadReceiver;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LR1/j;->g:Lcom/android/launcher3/stk/SimCardLoadReceiver;

    .line 5
    .line 6
    iput-object p2, p0, LR1/j;->h:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, LR1/j;->i:Landroid/content/Intent;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, LR1/j;->g:Lcom/android/launcher3/stk/SimCardLoadReceiver;

    .line 2
    .line 3
    iget-object v1, p0, LR1/j;->h:Landroid/content/Context;

    .line 4
    .line 5
    iget-object p0, p0, LR1/j;->i:Landroid/content/Intent;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/stk/SimCardLoadReceiver;->a(Lcom/android/launcher3/stk/SimCardLoadReceiver;Landroid/content/Context;Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
