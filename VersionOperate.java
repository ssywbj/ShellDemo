public class VersionOperate {

    public String add() {
        String version = "1.0.0.aa";
        if (version.matches("^[0-9]+\\.([0-9]\\.){2}[a-z]{2}$")) {
            String[] split = version.split("\\.");
            StringBuilder stringBuilder = new StringBuilder();
            for (String s : split) {
                stringBuilder.append(s);
            }
            return stringBuilder.toString();
        } else {
            return "invalid version !";
        }
    }

    public static void main(String[] args) {
        VersionOperate versionOperate = new VersionOperate();
        System.out.println(versionOperate.add());
    }

}
