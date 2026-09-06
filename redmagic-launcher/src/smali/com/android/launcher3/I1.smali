.class public final synthetic Lcom/android/launcher3/I1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/Workspace;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/Workspace;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/I1;->g:Lcom/android/launcher3/Workspace;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/I1;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->r2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
