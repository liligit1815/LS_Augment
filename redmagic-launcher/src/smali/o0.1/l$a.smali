.class public final Lo0/l$a;
.super Ljava/lang/Object;
.source "EmbeddingBackend.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field static final synthetic a:Lo0/l$a;

.field private static b:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "-",
            "Lo0/l;",
            "+",
            "Lo0/l;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lo0/l$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lo0/l$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lo0/l$a;->a:Lo0/l$a;

    .line 7
    .line 8
    sget-object v0, Lo0/l$a$a;->h:Lo0/l$a$a;

    .line 9
    .line 10
    sput-object v0, Lo0/l$a;->b:Lu4/l;

    .line 11
    .line 12
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lo0/l;
    .locals 1

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lo0/l$a;->b:Lu4/l;

    .line 7
    .line 8
    sget-object v0, Lo0/s;->h:Lo0/s$b;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lo0/s$b;->a(Landroid/content/Context;)Lo0/l;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lo0/l;

    .line 19
    .line 20
    return-object p0
.end method
