.class public final Ls1/Z;
.super Ljava/lang/Object;
.source "LauncherIcons_IconPool_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Ls1/X$b;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Ls1/X$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Ls1/X$c;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/Z;->a:Lg4/a;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lg4/a;)Ls1/Z;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Ls1/X$c;",
            ">;)",
            "Ls1/Z;"
        }
    .end annotation

    .line 1
    new-instance v0, Ls1/Z;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ls1/Z;-><init>(Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Ls1/X$c;)Ls1/X$b;
    .locals 1

    .line 1
    new-instance v0, Ls1/X$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ls1/X$b;-><init>(Ls1/X$c;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Ls1/X$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/Z;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ls1/X$c;

    .line 8
    .line 9
    invoke-static {p0}, Ls1/Z;->c(Ls1/X$c;)Ls1/X$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ls1/Z;->b()Ls1/X$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
