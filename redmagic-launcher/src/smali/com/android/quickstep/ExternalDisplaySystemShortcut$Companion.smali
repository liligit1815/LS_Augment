.class public final Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;
.super Ljava/lang/Object;
.source "ExternalDisplaySystemShortcut.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/ExternalDisplaySystemShortcut;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;-><init>()V

    return-void
.end method

.method public static synthetic createFactory$default(Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;Lcom/android/launcher3/b;ILjava/lang/Object;)Lcom/android/quickstep/TaskShortcutFactory;
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    new-instance p1, Lcom/android/launcher3/b;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/android/launcher3/b;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;->createFactory(Lcom/android/launcher3/b;)Lcom/android/quickstep/TaskShortcutFactory;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method


# virtual methods
.method public final createFactory()Lcom/android/quickstep/TaskShortcutFactory;
    .locals 2

    .line 1
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;->createFactory$default(Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;Lcom/android/launcher3/b;ILjava/lang/Object;)Lcom/android/quickstep/TaskShortcutFactory;

    move-result-object p0

    return-object p0
.end method

.method public final createFactory(Lcom/android/launcher3/b;)Lcom/android/quickstep/TaskShortcutFactory;
    .locals 0

    const-string p0, "abstractFloatingViewHelper"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    new-instance p0, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion$createFactory$1;

    invoke-direct {p0, p1}, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion$createFactory$1;-><init>(Lcom/android/launcher3/b;)V

    return-object p0
.end method
