.class LG/f$a;
.super Ljava/lang/Object;
.source "FontRequestWorker.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LG/f;->e(Landroid/content/Context;LG/e;LG/a;II)Landroid/graphics/Typeface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "LG/f$e;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Landroid/content/Context;

.field final synthetic c:LG/e;

.field final synthetic d:I


# direct methods
.method constructor <init>(Ljava/lang/String;Landroid/content/Context;LG/e;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LG/f$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, LG/f$a;->b:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, LG/f$a;->c:LG/e;

    .line 6
    .line 7
    iput p4, p0, LG/f$a;->d:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()LG/f$e;
    .locals 3

    .line 1
    iget-object v0, p0, LG/f$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, LG/f$a;->b:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, LG/f$a;->c:LG/e;

    .line 6
    .line 7
    invoke-static {v2}, Ljava/util/List;->of(Ljava/lang/Object;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget p0, p0, LG/f$a;->d:I

    .line 12
    .line 13
    invoke-static {v0, v1, v2, p0}, LG/f;->c(Ljava/lang/String;Landroid/content/Context;Ljava/util/List;I)LG/f$e;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, LG/f$a;->a()LG/f$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
