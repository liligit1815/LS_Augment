.class public final synthetic Lj1/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Ljava/util/List;

.field public final synthetic h:Lcom/android/quickstep/RemoteRunnable;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lcom/android/quickstep/RemoteRunnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lj1/h;->g:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lj1/h;->h:Lcom/android/quickstep/RemoteRunnable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lj1/h;->g:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Lj1/h;->h:Lcom/android/quickstep/RemoteRunnable;

    .line 4
    .line 5
    check-cast p1, Landroid/animation/Animator;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lj1/i;->r2(Ljava/util/List;Lcom/android/quickstep/RemoteRunnable;Landroid/animation/Animator;)Lh4/t;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
