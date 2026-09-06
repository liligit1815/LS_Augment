.class public final synthetic Lcom/android/launcher3/globalsearch/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/globalsearch/p;

.field public final synthetic h:[Ljava/lang/String;

.field public final synthetic i:Landroid/os/UserHandle;

.field public final synthetic j:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/globalsearch/p;[Ljava/lang/String;Landroid/os/UserHandle;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/m;->g:Lcom/android/launcher3/globalsearch/p;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/globalsearch/m;->h:[Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/globalsearch/m;->i:Landroid/os/UserHandle;

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/globalsearch/m;->j:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/m;->g:Lcom/android/launcher3/globalsearch/p;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/globalsearch/m;->h:[Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/globalsearch/m;->i:Landroid/os/UserHandle;

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/globalsearch/m;->j:I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/globalsearch/p;->o(Lcom/android/launcher3/globalsearch/p;[Ljava/lang/String;Landroid/os/UserHandle;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
