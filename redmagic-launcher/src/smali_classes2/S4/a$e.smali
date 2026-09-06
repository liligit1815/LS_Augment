.class LS4/a$e;
.super LS4/a$c;
.source "CompositeException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LS4/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# instance fields
.field private final a:Ljava/io/PrintWriter;


# direct methods
.method constructor <init>(Ljava/io/PrintWriter;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, LS4/a$c;-><init>(LS4/a$a;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, LS4/a$e;->a:Ljava/io/PrintWriter;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method a()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, LS4/a$e;->a:Ljava/io/PrintWriter;

    .line 2
    .line 3
    return-object p0
.end method

.method b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, LS4/a$e;->a:Ljava/io/PrintWriter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
