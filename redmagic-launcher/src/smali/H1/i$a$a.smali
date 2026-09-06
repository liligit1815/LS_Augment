.class final synthetic LH1/i$a$a;
.super Lkotlin/jvm/internal/m;
.source "ResponsiveCellSpecsProvider.kt"

# interfaces
.implements Lu4/q;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LH1/i$a;->a(Lcom/android/launcher3/util/W1;)LH1/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/m;",
        "Lu4/q<",
        "LH1/j$a$a;",
        "Landroid/content/res/TypedArray;",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "+",
        "LH1/q;",
        ">;",
        "LH1/d;",
        ">;"
    }
.end annotation


# static fields
.field public static final g:LH1/i$a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LH1/i$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, LH1/i$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LH1/i$a$a;->g:LH1/i$a$a;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 6

    .line 1
    const-string v4, "<init>(Lcom/android/launcher3/responsive/ResponsiveSpec$Companion$ResponsiveSpecType;Landroid/content/res/TypedArray;Ljava/util/Map;)V"

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v1, 0x3

    .line 5
    const-class v2, LH1/d;

    .line 6
    .line 7
    const-string v3, "<init>"

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/m;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final b(LH1/j$a$a;Landroid/content/res/TypedArray;Ljava/util/Map;)LH1/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH1/j$a$a;",
            "Landroid/content/res/TypedArray;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "LH1/q;",
            ">;)",
            "LH1/d;"
        }
    .end annotation

    .line 1
    const-string p0, "p0"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "p1"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "p2"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, LH1/d;

    .line 17
    .line 18
    invoke-direct {p0, p1, p2, p3}, LH1/d;-><init>(LH1/j$a$a;Landroid/content/res/TypedArray;Ljava/util/Map;)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LH1/j$a$a;

    .line 2
    .line 3
    check-cast p2, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    check-cast p3, Ljava/util/Map;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, LH1/i$a$a;->b(LH1/j$a$a;Landroid/content/res/TypedArray;Ljava/util/Map;)LH1/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
