.class Lf4/g$a;
.super Ljava/lang/Object;
.source "Providers.java"

# interfaces
.implements Lf4/f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lf4/g;->a(Lg4/a;)Lf4/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/f<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Lg4/a;


# direct methods
.method constructor <init>(Lg4/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lf4/g$a;->a:Lg4/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lf4/g$a;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
