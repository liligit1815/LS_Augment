.class public Lcom/android/launcher3/util/T1;
.super Ljava/lang/Object;
.source "PluginManagerWrapper.java"


# static fields
.field public static final a:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/util/T1;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/S1;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/util/S1;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/util/T1;->a:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lx2/e;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lx2/c;",
            ">(",
            "Lx2/e<",
            "TT;>;",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/util/T1;->b(Lx2/e;Ljava/lang/Class;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b(Lx2/e;Ljava/lang/Class;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lx2/c;",
            ">(",
            "Lx2/e<",
            "TT;>;",
            "Ljava/lang/Class<",
            "TT;>;Z)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public c(Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Lx2/e;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lx2/e<",
            "+",
            "Lx2/c;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method
