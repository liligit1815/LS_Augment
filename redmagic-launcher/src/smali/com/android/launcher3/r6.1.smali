.class public final synthetic Lcom/android/launcher3/r6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/Workspace;

.field public final synthetic h:Lcom/android/launcher3/model/data/y;

.field public final synthetic i:Lcom/android/launcher3/CellLayout;

.field public final synthetic j:Lcom/android/launcher3/widget/T;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/widget/T;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/r6;->g:Lcom/android/launcher3/Workspace;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/r6;->h:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/r6;->i:Lcom/android/launcher3/CellLayout;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/r6;->j:Lcom/android/launcher3/widget/T;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/r6;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/r6;->h:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/r6;->i:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/r6;->j:Lcom/android/launcher3/widget/T;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/Workspace;->l0(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/widget/T;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
