.class public final synthetic Lcom/android/launcher3/resource/y1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/content/ComponentName;

.field public final synthetic h:I

.field public final synthetic i:Landroid/os/UserHandle;

.field public final synthetic j:Z


# direct methods
.method public synthetic constructor <init>(Landroid/content/ComponentName;ILandroid/os/UserHandle;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/resource/y1;->g:Landroid/content/ComponentName;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/resource/y1;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/resource/y1;->i:Landroid/os/UserHandle;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/android/launcher3/resource/y1;->j:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/y1;->g:Landroid/content/ComponentName;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/resource/y1;->h:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/resource/y1;->i:Landroid/os/UserHandle;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/resource/y1;->j:Z

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/resource/UnReadInfoProvider;->b(Landroid/content/ComponentName;ILandroid/os/UserHandle;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
