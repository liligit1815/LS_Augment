.class public final LU0/h;
.super Ljava/lang/Object;
.source "IconSurfaceManagerProxy_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "LU0/g;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Landroid/content/Context;",
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
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LU0/h;->a:Lg4/a;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lg4/a;)LU0/h;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;)",
            "LU0/h;"
        }
    .end annotation

    .line 1
    new-instance v0, LU0/h;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LU0/h;-><init>(Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Landroid/content/Context;)LU0/g;
    .locals 1

    .line 1
    new-instance v0, LU0/g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LU0/g;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()LU0/g;
    .locals 0

    .line 1
    iget-object p0, p0, LU0/h;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p0}, LU0/h;->c(Landroid/content/Context;)LU0/g;

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
    invoke-virtual {p0}, LU0/h;->b()LU0/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
