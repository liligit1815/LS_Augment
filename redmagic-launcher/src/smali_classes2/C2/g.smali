.class public final LC2/g;
.super Ljava/lang/Object;
.source "UnfoldRemoteModule_UseReceivingFilterFactory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:LC2/d;


# direct methods
.method public constructor <init>(LC2/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC2/g;->a:LC2/d;

    .line 5
    .line 6
    return-void
.end method

.method public static a(LC2/d;)LC2/g;
    .locals 1

    .line 1
    new-instance v0, LC2/g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LC2/g;-><init>(LC2/d;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(LC2/d;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, LC2/d;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public b()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, LC2/g;->a:LC2/d;

    .line 2
    .line 3
    invoke-static {p0}, LC2/g;->c(LC2/d;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, LC2/g;->b()Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
