.class public final synthetic Lt1/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Landroid/os/UserHandle;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lt1/c;->g:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lt1/c;->h:Landroid/os/UserHandle;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lt1/c;->g:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lt1/c;->h:Landroid/os/UserHandle;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/util/E;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lt1/f;->b(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/launcher3/util/E;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
