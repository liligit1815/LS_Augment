.class public final Lz1/g5;
.super Ljava/lang/Object;
.source "WidgetsFilterDataProvider_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/g5$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lz1/f5;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lz1/g5;
    .locals 1

    .line 1
    invoke-static {}, Lz1/g5$a;->a()Lz1/g5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static c()Lz1/f5;
    .locals 1

    .line 1
    new-instance v0, Lz1/f5;

    .line 2
    .line 3
    invoke-direct {v0}, Lz1/f5;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Lz1/f5;
    .locals 0

    .line 1
    invoke-static {}, Lz1/g5;->c()Lz1/f5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lz1/g5;->b()Lz1/f5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
