.class public final Lz1/z0;
.super Ljava/lang/Object;
.source "BgDataModel_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lz1/y0;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lz1/u5;",
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
            "Lz1/u5;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/z0;->a:Lg4/a;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lg4/a;)Lz1/z0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Lz1/u5;",
            ">;)",
            "Lz1/z0;"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/z0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lz1/z0;-><init>(Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Lz1/u5;)Lz1/y0;
    .locals 1

    .line 1
    new-instance v0, Lz1/y0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lz1/y0;-><init>(Lz1/u5;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Lz1/y0;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/z0;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lz1/u5;

    .line 8
    .line 9
    invoke-static {p0}, Lz1/z0;->c(Lz1/u5;)Lz1/y0;

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
    invoke-virtual {p0}, Lz1/z0;->b()Lz1/y0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
