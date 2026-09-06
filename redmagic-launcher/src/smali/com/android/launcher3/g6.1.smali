.class public final synthetic Lcom/android/launcher3/g6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/Workspace;

.field public final synthetic h:Lcom/android/launcher3/CellLayout;

.field public final synthetic i:Lcom/android/launcher3/model/data/y;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/g6;->g:Lcom/android/launcher3/Workspace;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/g6;->h:Lcom/android/launcher3/CellLayout;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/g6;->i:Lcom/android/launcher3/model/data/y;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/g6;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/g6;->h:Lcom/android/launcher3/CellLayout;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/g6;->i:Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/Workspace;->V(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
