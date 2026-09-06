.class public final synthetic Lcom/android/quickstep/e5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/TaskIconCache;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Landroid/os/UserHandle;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TaskIconCache;Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/e5;->g:Lcom/android/quickstep/TaskIconCache;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/e5;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/e5;->i:Landroid/os/UserHandle;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/e5;->g:Lcom/android/quickstep/TaskIconCache;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/e5;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/e5;->i:Landroid/os/UserHandle;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/TaskIconCache;->a(Lcom/android/quickstep/TaskIconCache;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
