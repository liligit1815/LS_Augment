.class final Lo0/l$a$a;
.super Lkotlin/jvm/internal/p;
.source "EmbeddingBackend.kt"

# interfaces
.implements Lu4/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/l$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/l<",
        "Lo0/l;",
        "Lo0/l;",
        ">;"
    }
.end annotation


# static fields
.field public static final h:Lo0/l$a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lo0/l$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lo0/l$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lo0/l$a$a;->h:Lo0/l$a$a;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final a(Lo0/l;)Lo0/l;
    .locals 0

    .line 1
    const-string p0, "it"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lo0/l;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lo0/l$a$a;->a(Lo0/l;)Lo0/l;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
