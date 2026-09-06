.class public final synthetic Lz1/M0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Landroid/os/UserHandle;


# direct methods
.method public synthetic constructor <init>(Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/M0;->a:Landroid/os/UserHandle;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/M0;->a:Landroid/os/UserHandle;

    .line 2
    .line 3
    check-cast p1, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lz1/R0;->a(Landroid/os/UserHandle;Landroid/content/pm/PackageInstaller$SessionInfo;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
